import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'math_activity_state.freezed.dart';

@freezed
class MathActivityState with _$MathActivityState {
  factory MathActivityState({
    required bool isLoading,
    required List<int> answers,
    required List<int> options,
    required int currentQuestion,
    required int random,
  }) = _MathActivityState;

  factory MathActivityState.initial() => MathActivityState(
        isLoading: false,
        answers: [],
        options: [],
        currentQuestion: 0,
        random: 0,
      );

  const MathActivityState._();
}
