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
    required List<int> correctIndexes,
    required int level,
    required int verticalCount,
    required int horizontalCount,
    required List<MemoryGameModel> memoryGameModels,
    required MemoryGameModel? selectedMemoryGameModel1,
    required MemoryGameModel? selectedMemoryGameModel2,
    required Option<Failure> failure,
  }) = _MemoryGameState;

  factory MemoryGameState.initial() => MemoryGameState(
        isLoading: false,
        cardNumber: 0,
        level: 0,
        verticalCount: 2,
        horizontalCount: 2,
        correctIndexes: [],
        memoryGameModels: [],
        selectedMemoryGameModel1: null,
        selectedMemoryGameModel2: null,
        failure: none(),
      );

  const MemoryGameState._();
}
