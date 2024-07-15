//LanguageActivity state ile LanguageActivity provider

import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../states/language_activity_state.dart';

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

  void checkAnswer(int index) {
    if (state.options[index] == state.answers[state.currentQuestion]) {
      state = state.copyWith(isCorrect: true, isAnswered: true);
    } else {
      state = state.copyWith(isCorrect: false, isAnswered: true);
    }
    print("isCorrect: ${state.isCorrect}");
  }

  void setSelectedOption(int index) {
    state = state.copyWith(selectedOption: index);
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
