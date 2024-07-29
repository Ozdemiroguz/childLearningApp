import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'clock_level_state.freezed.dart';

@freezed
class ClockLevelState with _$ClockLevelState {
  factory ClockLevelState({
    required bool isLoading,
    required int level,
    required Option<Failure> failure,
  }) = _ClockLevelState;

  factory ClockLevelState.initial() => ClockLevelState(
        isLoading: false,
        level: 0,
        failure: none(),
      );

  const ClockLevelState._();
}
