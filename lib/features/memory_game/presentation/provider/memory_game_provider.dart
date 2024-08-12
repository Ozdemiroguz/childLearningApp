//Home state ile Home provider

import 'package:flip_card/flip_card_controller.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/home/presentation/states/home_state.dart';
import 'package:tododyst/features/memory_game/presentation/pages/memory_game_level_page.dart';

import '../../../../core/injections/locator.dart';
import '../../domain/models/memory_game_model.dart';
import '../states/memory_game_states/memory_game_state.dart';

final memoryGameProvider =
    NotifierProvider.autoDispose<_HomeNotifier, MemoryGameState>(
  _HomeNotifier.new,
);

class _HomeNotifier extends AutoDisposeNotifier<MemoryGameState> {
  @override
  MemoryGameState build() {
    Future(() => getHomeData());
    return MemoryGameState.initial();
  }

  Future<void> getHomeData() async {
    state = state.copyWith(isLoading: true);
    final result = await ref
        .read(memoryGameRepositoryProvider)
        .getMemoryGamesImages(ref.read(selectedLevelProvider));

    result.fold(
      (l) {
        state = state.copyWith(
          isLoading: false,
          failure: some(l),
        );
      },
      (r) {
        List<MemoryGameModel> memoryGameModels = [];
        for (var i = 0; i < r.length; i++) {
          memoryGameModels.add(MemoryGameModel(
              url: r[i], flipCardController: FlipCardController()));
        }
        //listeteyi 2 kere ekleyip karıştırıyoruz
        memoryGameModels.addAll(memoryGameModels);
        memoryGameModels.shuffle();
        state = state.copyWith(
          isLoading: false,
          memoryGameModels: memoryGameModels,
        );
        for (var i = 0; i < memoryGameModels.length; i++) {
          print(memoryGameModels[i].toString());
        }
      },
    );

    state = state.copyWith(
      isLoading: false,
    );
  }
}
