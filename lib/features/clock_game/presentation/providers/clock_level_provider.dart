//Home state ile Home provider

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../states/level_state/clock_level_state.dart';

final clockLevelProvider =
    NotifierProvider.autoDispose<_HomeNotifier, ClockLevelState>(
  _HomeNotifier.new,
);

class _HomeNotifier extends AutoDisposeNotifier<ClockLevelState> {
  @override
  ClockLevelState build() {
    Future(() => getHomeData());
    return ClockLevelState.initial();
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
