import 'dart:ffi';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'choose_skills_state.freezed.dart';

@freezed
class ChooseSkillsState with _$ChooseSkillsState {
  factory ChooseSkillsState({
    required bool isLoading,
    required String module,
    required List<String> skills,
    required String selectedSkills,
    required Option<Failure> failure,
  }) = _ChooseSkillsState;

  factory ChooseSkillsState.initial() => ChooseSkillsState(
        isLoading: false,
        module: "",
        skills: [],
        selectedSkills: "",
        failure: none(),
      );

  const ChooseSkillsState._();
}
