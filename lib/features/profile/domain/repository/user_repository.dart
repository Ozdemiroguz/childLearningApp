import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../core/models/user_models/user/user.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User>> getUser();
}
