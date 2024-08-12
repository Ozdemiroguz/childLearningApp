import 'package:flip_card/flip_card_controller.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tododyst/features/memory_game/domain/models/memory_game_model.dart';

import '../../../../../core/models/failure/failure.dart';

part 'memory_game_state.freezed.dart';

@freezed
class MemoryGameState with _$MemoryGameState {
  factory MemoryGameState({
    required bool isLoading,
    required int cardNumber,
    required int level,
    required List<MemoryGameModel> memoryGameModels,
    required Option<Failure> failure,
  }) = _MemoryGameState;

  factory MemoryGameState.initial() => MemoryGameState(
        isLoading: false,
        cardNumber: 0,
        level: 0,
        memoryGameModels: [],
        failure: none(),
      );

  const MemoryGameState._();
}
