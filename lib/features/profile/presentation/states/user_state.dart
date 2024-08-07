import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    required bool isLoading,
    required String name,
    required String surname,
    required String age,
    required String imageUrl,
    required Option<Failure> failure,
  }) = _UserState;

  factory UserState.initial() => UserState(
        isLoading: false,
        name: "",
        surname: "",
        age: "",
        imageUrl: "",
        failure: none(),
      );

  const UserState._();
}
