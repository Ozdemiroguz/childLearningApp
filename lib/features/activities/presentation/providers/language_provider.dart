//LanguageActivity state ile LanguageActivity provider

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';

import '../states/languageState/language_activity_state.dart';

final languageProvider = NotifierProvider.autoDispose<_LanguageActivityNotifier,
    LanguageActivityState>(
  _LanguageActivityNotifier.new,
);

class _LanguageActivityNotifier
    extends AutoDisposeNotifier<LanguageActivityState> {
  @override
  LanguageActivityState build() {
    Future(() => getLanguageActivityData());
    return LanguageActivityState.initial();
  }

  Future<void> getLanguageActivityData() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(
      isLoading: false,
      answers: ["Reading", "Speaking", "Writing"],
      currentQuestion: 0,
      random: Random().nextInt(5) + 1,
    );

    setOptions();
  }

  void setOptions() {
    final String temp = state.answers[state.currentQuestion];
    final List<String> tempOptions = [];
    tempOptions.add(temp);
    tempOptions.add("$temp?");
    tempOptions.add(removeRandomCharacter(temp));
    tempOptions.add(removeRandomCharacter(removeRandomCharacter(temp)));

    tempOptions.shuffle();
    state = state.copyWith(options: tempOptions);
  }

  void checkAnswer() {
    if (state.options[state.selectedOption!] ==
        state.answers[state.currentQuestion]) {
      state = state.copyWith(isCorrect: true, isAnswered: true);
    } else {
      state = state.copyWith(isCorrect: false, isAnswered: true);
    }
    setColor();
  }

  void wrongAnswer() {
    state = state.copyWith(
      isCorrect: false,
      isAnswered: false,
      selectedOption: null,
    );
    setColor();
  }

  void nextQuestion() {
    if (state.currentQuestion < state.answers.length - 1) {
      state = state.copyWith(
        currentQuestion: state.currentQuestion + 1,
        selectedOption: null,
        isAnswered: false,
        isCorrect: false,
      );
      setOptions();
      setColor();
    }
  }

  void setSelectedOption(int index) {
    if (state.isAnswered) {
      return;
    }
    state = state.copyWith(selectedOption: index);
    setColor();
  }

  void setColor() {
    if (!state.isAnswered && !state.isCorrect && state.selectedOption == null) {
      state = state.copyWith(color: Colors.transparent);
    } else if (!state.isAnswered && !state.isCorrect) {
      state = state.copyWith(color: darkBlue1);
    } else if (state.isAnswered && !state.isCorrect) {
      state = state.copyWith(color: orange);
    } else {
      state = state.copyWith(color: green);
    }
  }

  String removeRandomCharacter(String str) {
    if (str.isEmpty) {
      return str;
    }

    final random = Random();
    final index = random.nextInt(str.length);
    return str.replaceRange(index, index + 1, '');
  }
}
