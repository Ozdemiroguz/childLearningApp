import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tododyst/features/clock_game/domain/repository/models/day_time_zone.dart';

import '../../../domain/repository/models/clock_question.dart';

part 'clock_game_state.freezed.dart';

@freezed
class ClockGameState with _$ClockGameState {
  factory ClockGameState({
    required bool isLoading,
    required bool isHourIncreased,
    required bool isMinuteIncreased,
    required bool isHourReduced,
    required bool isMinuteReduced,
    required int hour,
    required int minute,
    required List<ClockQuestion> questions,
    required int currentQuestionIndex,
    required DayTimeZone? currentDayTimeZone,
  }) = _ClockGameState;

  factory ClockGameState.initial() => ClockGameState(
        isLoading: false,
        questions: [],
        hour: 0,
        minute: 0,
        currentQuestionIndex: 0,
        currentDayTimeZone: null,
        isHourIncreased: false,
        isMinuteIncreased: false,
        isHourReduced: false,
        isMinuteReduced: false,
      );

  const ClockGameState._();
}