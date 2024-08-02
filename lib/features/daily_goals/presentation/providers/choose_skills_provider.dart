//Home state ile Home provider

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/core/injections/locator.dart';
import 'package:tododyst/features/daily_goals/presentation/states/choose_skills/choose_skills_state.dart';

import 'choose_module_provider.dart';

final chooseSkillsProvider =
    NotifierProvider.autoDispose<_HomeNotifier, ChooseSkillsState>(
  _HomeNotifier.new,
);

class _HomeNotifier extends AutoDisposeNotifier<ChooseSkillsState> {
  @override
  ChooseSkillsState build() {
    Future(() => getHomeData());
    return ChooseSkillsState.initial();
  }

  Future<void> getHomeData() async {
    state = state.copyWith(isLoading: true);
    final result = await ref
        .read(dailyGoalsRepositoryProvider)
        .getSkills(ref.read(chooseModuleProvider).selectedModule);

    result.fold(
        (l) => state = state.copyWith(isLoading: false, failure: some(l)),
        (r) => state = state.copyWith(isLoading: false, skills: r),);
  }

  void changeSelectedSkill(int index) {
    final Set<int> selectedSkillIndexes = Set.from(state.selectedSkillIndexes);

    if (selectedSkillIndexes.contains(index)) {
      selectedSkillIndexes.remove(index);
    } else {
      selectedSkillIndexes.add(index);
    }

    state = state.copyWith(selectedSkillIndexes: selectedSkillIndexes);
  }

  void selectedError() {
    state = state.copyWith(
      selectedError: true,
    );
  }
}
