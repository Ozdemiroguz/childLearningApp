import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';

abstract interface class AuthRepository {
  Future<bool> isTokenExpired();
  Future<Option<Failure>> login(
      {required String username, required String password});
  Future<Option<Failure>> register({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
  });
}
