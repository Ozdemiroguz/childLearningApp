import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'choose_module_state.freezed.dart';

@freezed
class ChooseModuleState with _$ChooseModuleState {
  factory ChooseModuleState({
    required bool isLoading,
    required bool isModuleOpen,
    required List<String> modules,
    required String selectedModule,
    required Option<Failure> failure,
  }) = _ChooseModuleState;

  factory ChooseModuleState.initial() => ChooseModuleState(
        isLoading: false,
        isModuleOpen: false,
        modules: [],
        selectedModule: "",
        failure: none(),
      );

  const ChooseModuleState._();
}
