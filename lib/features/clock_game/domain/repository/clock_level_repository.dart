import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';

abstract interface class ClockLevelRepository {
  Future<Either<Failure, int>> getLevel();
}
