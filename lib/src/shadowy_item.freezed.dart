// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shadowy_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShadowyItem {
  String get id => throw _privateConstructorUsedError;
  Image get image => throw _privateConstructorUsedError;
  Image get shadowImage => throw _privateConstructorUsedError;
  bool get correct => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShadowyItemCopyWith<ShadowyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShadowyItemCopyWith<$Res> {
  factory $ShadowyItemCopyWith(
          ShadowyItem value, $Res Function(ShadowyItem) then) =
      _$ShadowyItemCopyWithImpl<$Res>;
  $Res call({String id, Image image, Image shadowImage, bool correct});
}

/// @nodoc
class _$ShadowyItemCopyWithImpl<$Res> implements $ShadowyItemCopyWith<$Res> {
  _$ShadowyItemCopyWithImpl(this._value, this._then);

  final ShadowyItem _value;
  // ignore: unused_field
  final $Res Function(ShadowyItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? shadowImage = freezed,
    Object? correct = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      shadowImage: shadowImage == freezed
          ? _value.shadowImage
          : shadowImage // ignore: cast_nullable_to_non_nullable
              as Image,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ShadowyItemCopyWith<$Res>
    implements $ShadowyItemCopyWith<$Res> {
  factory _$$_ShadowyItemCopyWith(
          _$_ShadowyItem value, $Res Function(_$_ShadowyItem) then) =
      __$$_ShadowyItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, Image image, Image shadowImage, bool correct});
}

/// @nodoc
class __$$_ShadowyItemCopyWithImpl<$Res> extends _$ShadowyItemCopyWithImpl<$Res>
    implements _$$_ShadowyItemCopyWith<$Res> {
  __$$_ShadowyItemCopyWithImpl(
      _$_ShadowyItem _value, $Res Function(_$_ShadowyItem) _then)
      : super(_value, (v) => _then(v as _$_ShadowyItem));

  @override
  _$_ShadowyItem get _value => super._value as _$_ShadowyItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? shadowImage = freezed,
    Object? correct = freezed,
  }) {
    return _then(_$_ShadowyItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      shadowImage: shadowImage == freezed
          ? _value.shadowImage
          : shadowImage // ignore: cast_nullable_to_non_nullable
              as Image,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShadowyItem implements _ShadowyItem {
  _$_ShadowyItem(
      {required this.id,
      required this.image,
      required this.shadowImage,
      this.correct = false});

  @override
  final String id;
  @override
  final Image image;
  @override
  final Image shadowImage;
  @override
  @JsonKey()
  final bool correct;

  @override
  String toString() {
    return 'ShadowyItem(id: $id, image: $image, shadowImage: $shadowImage, correct: $correct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShadowyItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.shadowImage, shadowImage) &&
            const DeepCollectionEquality().equals(other.correct, correct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(shadowImage),
      const DeepCollectionEquality().hash(correct));

  @JsonKey(ignore: true)
  @override
  _$$_ShadowyItemCopyWith<_$_ShadowyItem> get copyWith =>
      __$$_ShadowyItemCopyWithImpl<_$_ShadowyItem>(this, _$identity);
}

abstract class _ShadowyItem implements ShadowyItem {
  factory _ShadowyItem(
      {required final String id,
      required final Image image,
      required final Image shadowImage,
      final bool correct}) = _$_ShadowyItem;

  @override
  String get id;
  @override
  Image get image;
  @override
  Image get shadowImage;
  @override
  bool get correct;
  @override
  @JsonKey(ignore: true)
  _$$_ShadowyItemCopyWith<_$_ShadowyItem> get copyWith =>
      throw _privateConstructorUsedError;
}
