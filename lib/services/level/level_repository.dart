import 'package:fpdart/fpdart.dart';

import '../../core/models/failure/failure.dart';

abstract interface class LevelRepository {
  Future<Either<Failure, int>> getLevel(
    String gameType,
  );
}
