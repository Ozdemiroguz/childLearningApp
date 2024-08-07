import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:tododyst/core/models/user_models/user/user.dart';
import 'package:tododyst/core/models/user_models/user_type.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repository/user_repository.dart';

@LazySingleton(as: UserRepository)
final class UserRepositoryImp implements UserRepository {
  final NetworkService networkService;

  UserRepositoryImp({
    required this.networkService,
  });

  @override
  Future<Either<Failure, User>> getUser() {
    try {
      return Future.delayed(
        const Duration(milliseconds: 500),
        () => right(
          const User(
            id: "1",
            name: "John",
            surname: "Doe",
            age: "25",
            email: "johdoe@gmail.com",
            userType: UserType.parent,
            imageUrl:
                "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
      return Future.value(left(Failure.unknownError(tr('unknown_error'))));
    }
  }
}
