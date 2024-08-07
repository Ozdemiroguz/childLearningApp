//User state ile User provider

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/profile/presentation/states/user_state.dart';

import '../../../../core/injections/locator.dart';

final userProvider = NotifierProvider.autoDispose<_UserNotifier, UserState>(
  _UserNotifier.new,
);

class _UserNotifier extends AutoDisposeNotifier<UserState> {
  @override
  UserState build() {
    Future(() => getUserData());
    return UserState.initial();
  }

  Future<void> getUserData() async {
    state = state.copyWith(isLoading: true);

    final result = await ref.read(userRepositoryProvider).getUser();

    result.fold(
      (failure) => state = state.copyWith(failure: some(failure)),
      (user) => state = state.copyWith(
        name: user.name,
        surname: user.surname,
        age: user.age,
        imageUrl: user.imageUrl,
      ),
    );
    state = state.copyWith(isLoading: false);
  }

  void nameChanged(String name) {
    state = state.copyWith(name: name);
  }

  void surnameChanged(String surname) {
    state = state.copyWith(surname: surname);
  }

  void ageChanged(String age) {
    state = state.copyWith(age: age);
  }

  void imageUrlChanged(String imageUrl) {
    state = state.copyWith(imageUrl: imageUrl);
  }
}
