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

    print(
        "ref.read(selectedLevelProvider) : ${ref.read(selectedLevelProvider) == 0 ? 2 : ref.read(selectedLevelProvider)!}");
    final result = await ref
        .read(memoryGameRepositoryProvider)
        .getMemoryGamesImages(ref.read(selectedLevelProvider) == 0
            ? 2
            : ref.read(selectedLevelProvider)!);

    result.fold(
      (l) {
        state = state.copyWith(
          isLoading: false,
          failure: some(l),
        );
      },
      (r) {
        final List<MemoryGameModel> memoryGameModels = [];
        for (var i = 0; i < r.urls.length; i++) {
          memoryGameModels.add(MemoryGameModel(
              url: r.urls[i], flipCardController: FlipCardController()));
          memoryGameModels.add(MemoryGameModel(
              url: r.urls[i], flipCardController: FlipCardController()));
        }

        memoryGameModels.shuffle();
        state = state.copyWith(
          level: r.level,
          cardNumber: r.urls.length,
          verticalCount: r.verticalCount,
          horizontalCount: r.horizontalCount,
          isLoading: false,
          memoryGameModels: memoryGameModels,
        );
      },
    );

    state = state.copyWith(
      isLoading: false,
    );
  }

  Future<void> chooseCard(int index) async {
    if (state.selectedMemoryGameModel1 == null) {
      state = state.copyWith(
        selectedMemoryGameModel1: state.memoryGameModels[index],
      );
      state.memoryGameModels[index].flipCardController.toggleCard();
    } else if (state.selectedMemoryGameModel2 == null &&
        state.selectedMemoryGameModel1 != state.memoryGameModels[index]) {
      state = state.copyWith(
        selectedMemoryGameModel2: state.memoryGameModels[index],
      );
      state.memoryGameModels[index].flipCardController.toggleCard();

      await checkCards();
    }
  }

  Future<void> checkCards() async {
    if (state.selectedMemoryGameModel1!.url ==
        state.selectedMemoryGameModel2!.url) {
      Future.delayed(const Duration(seconds: 1), () {
        state = state.copyWith(
          correctIndexes: [
            ...state.correctIndexes,
            state.memoryGameModels.indexOf(state.selectedMemoryGameModel1!),
            state.memoryGameModels.indexOf(state.selectedMemoryGameModel2!),
          ],
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        state
            .memoryGameModels[
                state.memoryGameModels.indexOf(state.selectedMemoryGameModel1!)]
            .flipCardController
            .toggleCard();
        state
            .memoryGameModels[
                state.memoryGameModels.indexOf(state.selectedMemoryGameModel2!)]
            .flipCardController
            .toggleCard();
      });
    }

    Future.delayed(const Duration(milliseconds: 1500), () {
      state = state.copyWith(
        selectedMemoryGameModel1: null,
        selectedMemoryGameModel2: null,
      );
    });
  }
}
