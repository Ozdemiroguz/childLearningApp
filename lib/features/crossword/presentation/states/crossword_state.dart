import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tododyst/features/crossword/domain/models/word_data.dart';

part 'crossword_state.freezed.dart';

@freezed
class CrossWordState with _$CrossWordState {
  factory CrossWordState({
    required bool isLoading,
    required int time,
    required WordData wordData,
    required List<String> wordsToFind,
    required Color color,
    required bool sectionCompleted,
  }) = _CrossWordState;

  factory CrossWordState.initial() => CrossWordState(
        isLoading: false,
        time: 0,
        wordData: WordData(
          words: [],
          board: [],
        ),
        wordsToFind: [],
        color: Colors.red,
        sectionCompleted: false,
      );

  const CrossWordState._();
}
