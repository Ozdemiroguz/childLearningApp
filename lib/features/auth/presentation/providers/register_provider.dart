//register state ile register provider

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/core/models/user_models/user/user.dart';
import 'package:tododyst/utils/validators.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/user_models/user_type.dart';
import '../states/register/register_state.dart';

final registerProvider =
    NotifierProvider.autoDispose<_RegisterNotifier, RegisterState>(
  _RegisterNotifier.new,
);

class _RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  @override
  RegisterState build() {
    Future(() => init());
    return RegisterState.initial();
  }

  Future<void> init() async {
    state = state.copyWith(
      pinputFailure: validatePinput(state.pinput),
      phoneNumberFailure: validatePhone(state.phoneNumber),
    );
  }

  Future<void> register() async {
    state = state.copyWith(isLoading: true);
    final result = await ref.read(authRepositoryProvider).register(
          email: state.email,
          firstName: state.firstName,
          lastName: state.lastName,
          password: state.password,
        );
    state = state.copyWith(failure: result, isLoading: false);
  }

  void onChangedCountryCode(String? countryCode) {
    state = state.copyWith(countryCode: countryCode ?? "+90");
  }

  void onChangedPhoneNumber(String? phoneNumber) {
    state = state.copyWith(
        phoneNumber: phoneNumber ?? "",
        phoneNumberFailure: validatePhone(phoneNumber ?? ""));
  }

  void onChangedPinput(String pinput) {
    print("pinput: $pinput");
    state =
        state.copyWith(password: pinput, pinputFailure: validatePinput(pinput));
    print("state.PinputFailure: ${state.pinputFailure} ");
    print("state.PinputFailure: ${state.pinputFailure.toNullable()?.message} ");
  }

  void onChangedFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void onChangedLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void onChangedEmail(String email) {
    state =
        state.copyWith(email: email, emailFailure: validateEmailAddress(email));
  }

  void onChangedPassword(String password) {
    state = state.copyWith(
      password: password,
    );
  }

  void onChangedConfirmPassword(String confirmPassword) {
    state = state.copyWith(
        confirmPassword: confirmPassword,
        confirmPasswordFailure: validateConfirmPassword(
            state.password, state.confirmPassword, "passwords do not match"));
  }

  void onChangedType(UserType userType) {
    state = state.copyWith(userType: userType);
  }
}
