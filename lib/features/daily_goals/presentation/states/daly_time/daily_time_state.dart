import 'dart:ffi';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'daily_time_state.freezed.dart';

@freezed
class DailyTimeState with _$DailyTimeState {
  factory DailyTimeState({
    required bool isLoading,
    required int hour,
    required int minute,
    required Set<int> selectedDaysIndexes,
    required Option<Failure> failure,
  }) = _DailyTimeState;

  factory DailyTimeState.initial() => DailyTimeState(
        isLoading: false,
        hour: 0,
        minute: 0,
        selectedDaysIndexes: {},
        failure: none(),
      );

  const DailyTimeState._();
}
