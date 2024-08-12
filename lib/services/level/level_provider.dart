//Home state ile Home provider

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/level_state/level_state.dart';

final levelProvider = NotifierProvider.autoDispose<_HomeNotifier, LevelState>(
  _HomeNotifier.new,
);

class _HomeNotifier extends AutoDisposeNotifier<LevelState> {
  @override
  LevelState build() {
    Future(() => getHomeData(null));
    return LevelState.initial();
  }

  Future<void> getHomeData(
    String? gameType,
  ) async {
    state = state.copyWith(isLoading: true);
    if (gameType == null) {
      state = state.copyWith(
        isLoading: false,
        level: 5,
        failure: none(),
      );
      return;
    }

    final result = await ref.read(levelRepositoryProvider).getLevel(gameType);

    state = state.copyWith(
      isLoading: false,
      level: result.getOrElse((l) => 0),
      failure: result.getLeft(),
    );
  }
}
