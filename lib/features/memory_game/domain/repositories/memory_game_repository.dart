import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';

abstract interface class MemoryGameRepository {
  Future<Either<Failure, List<String>>> getMemoryGamesImages(
    int level,
  );
}
