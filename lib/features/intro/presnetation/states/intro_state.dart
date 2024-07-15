import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_state.freezed.dart';

@freezed
class IntroState with _$IntroState {
  factory IntroState({
    required int counter,
    required List<bool> levels,
  }) = _IntroState;

  factory IntroState.initial() => IntroState(
        counter: 0,
        levels: [true, false, false],
      );

  const IntroState._();
}
