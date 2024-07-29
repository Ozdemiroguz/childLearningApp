//Home state ile Home provider

import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/clock_game/domain/repository/models/clock_question.dart';

import '../../domain/repository/models/answer_button.dart';
import '../../domain/repository/models/day_time_zone.dart';
import '../states/game_state/clock_game_state.dart';

final clockGameProvider =
    NotifierProvider.autoDispose<_HomeNotifier, ClockGameState>(
  _HomeNotifier.new,
);

class _HomeNotifier extends AutoDisposeNotifier<ClockGameState> {
  @override
  ClockGameState build() {
    Future(() => getHomeData());
    return ClockGameState.initial();
  }

  Future<void> getHomeData() async {
    state = state.copyWith(isLoading: true);

    final Set<ClockQuestion> clockQuestions = {};

    while (clockQuestions.length < 3) {
      final int hour = //0-24 arasında rastgele saat
          Random().nextInt(23) + 1;

      final int minute = //0-60 arasında rastgele dakika
          Random().nextInt(10) + 1;

      final question = ClockQuestion(
        hour: hour,
        minute: minutes[minute],
        dayTimeZone: getDayTimeZoneFromHour(hour),
      );

      clockQuestions.add(question);
    }

    state = state.copyWith(
      isLoading: false,
      questions: clockQuestions.toList(),
      currentDayTimeZone: clockQuestions.first.dayTimeZone,
    );
  }

  void increaseHour() {
    state = state.copyWith(
      hour: (state.hour + 1) % 24,
      isHourIncreased: true,
    );
    canAnswer();
  }

  void reduceHour() {
    state = state.copyWith(
      hour: (state.hour - 1) % 24,
      isHourReduced: true,
    );
    canAnswer();
  }

  void increaseMinute() {
    state = state.copyWith(
      minute: (state.minute + 1) % 60,
      isMinuteIncreased: true,
    );
    canAnswer();
  }

  void reduceMinute() {
    state = state.copyWith(
      minute: (state.minute - 1) % 60,
      isMinuteReduced: true,
    );
    canAnswer();
  }

  void selectTimeZone(DayTimeZone dayTimeZone) {
    state = state.copyWith(currentDayTimeZone: dayTimeZone);
    canAnswer();
  }

  void setInitialTime() {
    state = state.copyWith(
      isHourIncreased: false,
      isMinuteIncreased: false,
      isHourReduced: false,
      isMinuteReduced: false,
      isAnswered: false,
      isAnswerCorrect: false,
      answerButtonStates: AnswerButtonStates.initial,
    );
  }

  void canAnswer() {
    if (state.isAnswered && state.isAnswerCorrect) {
      state = state.copyWith(answerButtonStates: AnswerButtonStates.correct);
      return;
    }
    if (state.isAnswered && !state.isAnswerCorrect) {
      state = state.copyWith(answerButtonStates: AnswerButtonStates.wrong);
      return;
    }
    if (state.isHourIncreased ||
        state.isHourReduced ||
        state.isMinuteIncreased ||
        state.isMinuteReduced) {
      state = state.copyWith(answerButtonStates: AnswerButtonStates.canAnswer);
      return;
    }
  }

  void checkAnswer() {
    if (state.hour == state.questions[state.currentQuestionIndex].hour &&
        state.minute == state.questions[state.currentQuestionIndex].minute) {
      if (state.currentQuestionIndex == state.questions.length - 1) {
        state =
            state.copyWith(answerButtonStates: AnswerButtonStates.completed);
        return;
      }
      state = state.copyWith(isAnswerCorrect: true, isAnswered: true);
    } else {
      state = state.copyWith(isAnswerCorrect: false, isAnswered: true);
    }

    canAnswer();
  }

  void increaseLevel() {
    state =
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1);
    state = state.copyWith(
        currentDayTimeZone:
            state.questions[state.currentQuestionIndex].dayTimeZone);
    setInitialTime();
  }
}

const List<int> minutes = [
  0,
  10,
  15,
  20,
  25,
  30,
  35,
  40,
  45,
  50,
  55,
];
