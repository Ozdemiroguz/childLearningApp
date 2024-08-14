import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:tododyst/constants/memory_game.dart';
import 'package:tododyst/features/crossword/domain/models/word_data.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../core/models/memory_game_info/memory_game_info.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repositories/memory_game_repository.dart';

@LazySingleton(as: MemoryGameRepository)
final class MemoryGameRepositoryImpl implements MemoryGameRepository {
  final NetworkService networkService;

  MemoryGameRepositoryImpl({
    required this.networkService,
  });

  @override
  Future<Either<Failure, MemoryGameInfo>> getMemoryGamesImages(int level) {
    // TODO: implement getMemoryGamesImages
    try {
      return Future.delayed(const Duration(milliseconds: 500), () {
        print('level: $level');
        return right(memoryGameInfos[level - 1]);
      });
    } catch (e) {
      return Future.value(left(Failure.unknownError('unknown_error')));
    }
  }
}
