import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadowy/src/cubit/shadowy_cubit.dart';
import 'package:shadowy/src/shadowy_item.dart';

class Shadowy extends StatelessWidget {
  const Shadowy({
    Key? key,
    required this.images,
    this.onComplete,
  }) : super(key: key);

  final List<Uint8List> images;
  final VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShadowyCubit(
        images: images,
        onComplete: onComplete,
      ),
      child: _Shadowy(),
    );
  }
}

class _Shadowy extends StatelessWidget {
  const _Shadowy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shadowyCubit = BlocProvider.of<ShadowyCubit>(context);

    return BlocBuilder<ShadowyCubit, ShadowyState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (items, shadowItems) => Column(
            children: [
              Row(
                children: [
                  for (final item in shadowItems)
                    Flexible(
                      child: DragTarget<ShadowyItem>(
                        builder: (context, candidateData, rejectedData) =>
                            item.correct ? item.image : item.shadowImage,
                        onWillAccept: (data) => data?.id == item.id,
                        onAccept: shadowyCubit.itemCorrectlyDropped,
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final item in items.where((element) => !element.correct))
                    Flexible(
                      child: Draggable<ShadowyItem>(
                        data: item,
                        feedback: Image(
                          image: item.image.image,
                          width: 120.0,
                          height: 120.0,
                        ),
                        childWhenDragging: Container(),
                        child: Image(
                          image: item.image.image,
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: SizedBox.new,
        );
      },
    );
  }
}
