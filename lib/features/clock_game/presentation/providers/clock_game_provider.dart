//Home state ile Home provider

import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/clock_game/domain/repository/models/clock_question.dart';

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

    int counter = 0;

    while (clockQuestions.length < 10) {
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
      counter++;

      if (counter > 11) {
        break;
      }
    }

    state = state.copyWith(
      isLoading: false,
      questions: clockQuestions.toList(),
    );
  }

  void SetInitialTime() {
    state = state.copyWith(
      currentDayTimeZone: null,
      isHourIncreased: false,
      isMinuteIncreased: false,
      isHourReduced: false,
      isMinuteReduced: false,
    );
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
