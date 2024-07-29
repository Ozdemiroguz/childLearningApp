import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tododyst/features/clock_game/domain/repository/models/answer_button.dart';
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
    required bool isAnswered,
    required bool isAnswerCorrect,
    required int hour,
    required int minute,
    required List<ClockQuestion> questions,
    required int currentQuestionIndex,
    required DayTimeZone currentDayTimeZone,
    required AnswerButtonStates answerButtonStates,
  }) = _ClockGameState;

  factory ClockGameState.initial() => ClockGameState(
        isLoading: false,
        questions: [],
        hour: 0,
        minute: 0,
        currentQuestionIndex: 0,
        currentDayTimeZone: DayTimeZone.morning,
        isHourIncreased: false,
        isMinuteIncreased: false,
        isHourReduced: false,
        isMinuteReduced: false,
        isAnswered: false,
        isAnswerCorrect: false,
        answerButtonStates: AnswerButtonStates.initial,
      );

  const ClockGameState._();
}
