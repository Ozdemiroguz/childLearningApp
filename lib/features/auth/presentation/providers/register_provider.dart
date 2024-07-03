//register state ile register provider

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../states/register/register_state.dart';

final registerProvider =
    NotifierProvider.autoDispose<_RegisterNotifier, RegisterState>(
  _RegisterNotifier.new,
);

class _RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  @override
  RegisterState build() => RegisterState.initial();

  void onChangedPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void onChangedPassword(String password) {
    state = state.copyWith(password: password);
  }
}
