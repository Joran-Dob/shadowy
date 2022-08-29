part of 'shadowy_cubit.dart';

@freezed
class ShadowyState with _$ShadowyState {
  const factory ShadowyState.initial() = _Initial;
  const factory ShadowyState.loading() = _Loading;
  const factory ShadowyState.loaded({
    required List<ShadowyItem> items,
    required List<ShadowyItem> shadowItems,
  }) = _Loaded;
}
