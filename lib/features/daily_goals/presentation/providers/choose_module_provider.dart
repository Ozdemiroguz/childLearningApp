//Home state ile Home provider

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/core/injections/locator.dart';
import 'package:tododyst/features/daily_goals/presentation/states/choose_module_state.dart';
import 'package:tododyst/features/home/presentation/states/home_state.dart';

final chooseModuleProvider =
    NotifierProvider.autoDispose<_HomeNotifier, ChooseModuleState>(
  _HomeNotifier.new,
);

class _HomeNotifier extends AutoDisposeNotifier<ChooseModuleState> {
  @override
  ChooseModuleState build() {
    Future(() => getHomeData());
    return ChooseModuleState.initial();
  }

  Future<void> getHomeData() async {
    state = state.copyWith(isLoading: true);
    final result = await ref.read(dailyGoalsRepositoryProvider).getModules();

    result.fold(
        (l) => state = state.copyWith(isLoading: false, failure: some(l)),
        (r) => state = state.copyWith(isLoading: false, modules: r));
  }

  void changeIsModuleOpen() {
    state = state.copyWith(isModuleOpen: !state.isModuleOpen);
  }
}
