import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../core/models/value_failure/value_failure.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    required bool isLoading,
    required String phoneNumber,
    required String password,
    required Option<Failure> failure,
    required Option<ValueFailure> userNameFailure,
    required Option<ValueFailure> passwordFailure,
    required List<bool> agreementCheckList,
    required ValidationErrorVisibility validationErrorVisibility,
  }) = _RegisterState;

  factory RegisterState.initial() => RegisterState(
        isLoading: false,
        phoneNumber: "",
        password: "",
        failure: none(),
        userNameFailure: none(),
        passwordFailure: none(),
        agreementCheckList: List.generate(3, (index) => false),
        validationErrorVisibility: const ValidationErrorVisibility.hide(),
      );


  const RegisterState._();

  bool get isFormValid => userNameFailure.isNone() && passwordFailure.isNone();

}
