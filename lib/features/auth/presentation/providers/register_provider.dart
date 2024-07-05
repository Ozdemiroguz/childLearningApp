//register state ile register provider

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/core/models/user_models/user/user.dart';
import 'package:tododyst/utils/validators.dart';

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

  void onChangedPassword(String password) {
    state = state.copyWith(password: password);
  }

  void onChangedType(UserType userType) {
    state = state.copyWith(userType: userType);
  }
}
