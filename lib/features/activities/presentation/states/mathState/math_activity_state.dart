import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'math_activity_state.freezed.dart';

@freezed
class MathActivityState with _$MathActivityState {
  factory MathActivityState({
    required bool isLoading,
    required List<int> answers,
    required List<String> questions,
    required List<String> options,
    required int currentQuestion,
    required int? selectedOption,
    required bool isCorrect,
    required bool isAnswered,
    required int random,
    required Color color,
  }) = _MathActivityState;

  factory MathActivityState.initial() => MathActivityState(
        isLoading: false,
        answers: [],
        options: [],
        questions: [],
        currentQuestion: 0,
        selectedOption: null,
        isCorrect: false,
        isAnswered: false,
        random: 0,
        color: Colors.transparent,
      );

  const MathActivityState._();
}
