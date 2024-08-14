import 'package:fpdart/fpdart.dart';
import 'package:tododyst/core/models/memory_game_info/memory_game_info.dart';

import '../../../../core/models/failure/failure.dart';

abstract interface class MemoryGameRepository {
  Future<Either<Failure, MemoryGameInfo>> getMemoryGamesImages(
    int level,
  );
}
