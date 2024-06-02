//register state ile register provider 

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/features/auth/presentation/states/register_state.dart';

final registerProvider = NotifierProvider.autoDispose<_RegisterNotifier, RegisterState>(
  _RegisterNotifier.new,
);

class _RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  @override
  RegisterState build() => RegisterState.initial();


  void onChangedCheckList(int index) {
    state = state.copyWith(
      agreementCheckList: [
        for (int i = 0; i < state.agreementCheckList.length; i++)
          if (i == index) 
          !state.agreementCheckList[i]
          else 
          state.agreementCheckList[i],
      ],
    );
 
  }

  void onChangedPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }
  void onChangedPassword(String password) {
    state = state.copyWith(password: password);
  }



}
