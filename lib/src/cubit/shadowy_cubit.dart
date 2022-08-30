import 'dart:isolate';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shadowy/src/shadowy_item.dart';
import 'package:uuid/uuid.dart';
import 'package:image/image.dart';
part 'shadowy_state.dart';
part 'shadowy_cubit.freezed.dart';

class ShadowyCubit extends Cubit<ShadowyState> {
  ShadowyCubit({
    required List<Uint8List> images,
    required VoidCallback? onComplete,
  })  : _puzzleCompleteCallback = onComplete,
        super(ShadowyState.initial()) {
    for (var image in images) {
      _images[Uuid().v4()] = image;
    }
    _init();
  }

  final Map<String, Uint8List> _images = {};
  final VoidCallback? _puzzleCompleteCallback;
  List<ShadowyItem> _shadowItems = [];
  List<ShadowyItem> _items = [];

  Future<void> _init() async {
    emit(ShadowyState.loading());
    List<Future<material.Image>> _shadowImageItemFutures = [];
    _items = [];
    for (final entry in _images.entries) {
      final shadowImageFuture = _createImageSilhouette(
        entry.value,
      );
      _shadowImageItemFutures.add(shadowImageFuture);
    }
    final shadowImageItems = await Future.wait(_shadowImageItemFutures);

    var index = 0;
    for (final element in _images.entries) {
      _items.add(
        ShadowyItem(
          id: element.key,
          image: material.Image.memory(element.value),
          shadowImage: shadowImageItems[index],
          correct: false,
        ),
      );
      index++;
    }

    _shadowItems = _items.where((element) => !element.correct).toList()..shuffle();
    emit(
      ShadowyState.loaded(
        items: _items,
        shadowItems: _shadowItems,
      ),
    );
  }

  bool get puzzleSolved => _items.isEmpty;

  void itemCorrectlyDropped(ShadowyItem item) {
    emit(const ShadowyState.loading());
    final correctItems = _shadowItems.where((shadowItem) => shadowItem.id == item.id);
    for (var item in _shadowItems) {
      if (!item.correct) {
        _shadowItems[_shadowItems.indexOf(item)] =
            item.copyWith(correct: correctItems.contains(item));
      }
    }
    _items = _items.where((shadowItem) => shadowItem.id != item.id).toList();
    if (puzzleSolved) {
      _puzzleCompleteCallback?.call();
    }
    emit(
      ShadowyState.loaded(
        items: _items,
        shadowItems: _shadowItems,
      ),
    );
  }
}

Future<material.Image> _createImageSilhouette(Uint8List image) async {
  final p = ReceivePort();
  await Isolate.spawn(imageSilhouetteIsolate, [p.sendPort, image]);
  return await p.first as material.Image;
}

void imageSilhouetteIsolate(List<dynamic> args) {
  final responsePort = args[0] as SendPort;
  final image = args[1] as Uint8List;
  final convertedImage = decodeImage(image)!;
  convertedImage.channels = Channels.rgba;

  Isolate.exit(
    responsePort,
    material.Image.memory(
      Uint8List.fromList(
        encodePng(
          adjustColor(convertedImage, contrast: 1.0, brightness: 0.0, saturation: 0.0),
        ),
      ),
    ),
  );
}
