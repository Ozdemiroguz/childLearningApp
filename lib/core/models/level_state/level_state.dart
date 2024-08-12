import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../failure/failure.dart';

part 'level_state.freezed.dart';

@freezed
class LevelState with _$LevelState {
  factory LevelState({
    required bool isLoading,
    required int level,
    required Option<Failure> failure,
  }) = _LevelState;

  factory LevelState.initial() => LevelState(
        isLoading: false,
        level: 0,
        failure: none(),
      );

  const LevelState._();
}
