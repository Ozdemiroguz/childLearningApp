//Home state ile Home provider

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/level_state/level_state.dart';

final clockLevelProvider =
    NotifierProvider.autoDispose<_HomeNotifier, LevelState>(
  _HomeNotifier.new,
);

class _HomeNotifier extends AutoDisposeNotifier<LevelState> {
  @override
  LevelState build() {
    Future(() => getHomeData());
    return LevelState.initial();
  }

  Future<void> getHomeData() async {
    state = state.copyWith(isLoading: true);
    final result = await ref.read(clockLevelRepositoryProvider).getLevel();

    state = state.copyWith(
      isLoading: false,
      level: result.getOrElse((l) => 0),
      failure: result.getLeft(),
    );
  }
}
