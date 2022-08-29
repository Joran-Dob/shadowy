import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shadowy_item.freezed.dart';

@freezed
class ShadowyItem with _$ShadowyItem {
  factory ShadowyItem({
    required String id,
    required Image image,
    required Image shadowImage,
    @Default(false) bool correct,
  }) = _ShadowyItem;
}
