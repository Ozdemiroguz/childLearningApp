import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_activity_state.freezed.dart';

@freezed
class LanguageActivityState with _$LanguageActivityState {
  factory LanguageActivityState({
    required bool isLoading,
    required List<String> answers,
    required List<String> options,
    required int currentQuestion,
    required int? selectedOption,
    required bool isCorrect,
    required bool isAnswered,
    required int random,
    required Color color,
  }) = _LanguageActivityState;

  factory LanguageActivityState.initial() => LanguageActivityState(
        isLoading: false,
        answers: [],
        options: [],
        currentQuestion: 0,
        selectedOption: null,
        isCorrect: false,
        isAnswered: false,
        random: 0,
        color: Colors.transparent,
      );

  const LanguageActivityState._();
}
