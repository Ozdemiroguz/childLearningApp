//MathActivity state ile MathActivity provider

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';

import '../states/mathState/math_activity_state.dart';

final mathProvider =
    NotifierProvider.autoDispose<_MathActivityNotifier, MathActivityState>(
  _MathActivityNotifier.new,
);

class _MathActivityNotifier extends AutoDisposeNotifier<MathActivityState> {
  @override
  MathActivityState build() {
    Future(() => getMathActivityData());
    return MathActivityState.initial();
  }

  Future<void> getMathActivityData() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(isLoading: false, answers: [12, 13, 14]);
    setQuestion();
    setOptions();
  }

  void setOptions() {
    final int temp = state.answers[state.currentQuestion];
    final Set<String> tempOptions = {};

    final random = Random();
    tempOptions.add(temp.toString());

    while (tempOptions.length < 4) {
      final randomValue = random.nextInt(temp + 10);
      tempOptions.add(randomValue.toString());
    }

    //if the is a duplicate option, remove it and add a new one and check again

    state = state.copyWith(options: tempOptions.toList()..shuffle());
  }

  void setQuestion() {
    final List<String> questions = [];

    final random = Random();
    for (int i = 0; i < state.answers.length; i++) {
      final int a = 1 + random.nextInt(state.answers[i] - 1);
      final int b = state.answers[i] - a;

      questions.add("$a + $b");
    }

    state = state.copyWith(questions: questions);
  }

  void checkAnswer() {
    if (state.options[state.selectedOption!] ==
        state.answers[state.currentQuestion].toString()) {
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
