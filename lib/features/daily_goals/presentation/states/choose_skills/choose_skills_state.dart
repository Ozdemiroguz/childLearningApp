
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'choose_skills_state.freezed.dart';

@freezed
class ChooseSkillsState with _$ChooseSkillsState {
  factory ChooseSkillsState({
    required bool isLoading,
    required bool selectedError,
    required String module,
    required List<String> skills,
    required Set<int> selectedSkillIndexes,
    required String selectedSkills,
    required Option<Failure> failure,
  }) = _ChooseSkillsState;

  factory ChooseSkillsState.initial() => ChooseSkillsState(
        isLoading: false,
        selectedError: false,
        module: "",
        skills: [],
        selectedSkillIndexes: {},
        selectedSkills: "",
        failure: none(),
      );

  const ChooseSkillsState._();
}
