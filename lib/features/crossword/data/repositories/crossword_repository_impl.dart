import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:tododyst/features/crossword/domain/models/word_data.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repositories/crosword_repository.dart';

@LazySingleton(as: CrosswordRepository)
final class CrosswordRepositoryImpl implements CrosswordRepository {
  final NetworkService networkService;

  CrosswordRepositoryImpl({
    required this.networkService,
  });

  @override
  Future<Either<Failure, WordData>> getCrosswords(int sectionId) async {
    //dummy implementation with delayed response
    final Future<Either<Failure, WordData>> crosswordFuture =
        Future.delayed(const Duration(seconds: 2), () {
      return Right(sectionId % 2 == 0
          ? WordData(board: [
              ["W", "H", "I", "T", "E", "P"],
              ["R", "E", "D", "S", "Y", "U"],
              ["B", "S", "C", "Y", "K", "R"],
              ["B", "L", "A", "C", "K", "P"],
              ["A", "F", "U", "U", "A", "L"],
              ["K", "D", "A", "E", "A", "E"],
            ], words: [
              "WHITE",
              "RED",
              "BLACK",
              "BLUE",
              "PURPLE",
            ])
          : WordData(board: [
              ['R', 'A', 'B', 'B', 'I', 'T', 'C'],
              ['M', 'S', 'L', 'I', 'O', 'N', 'O'],
              ['B', 'O', 'M', 'T', 'P', 'K', 'W'],
              ['I', 'A', 'N', 'Y', 'B', 'U', 'A'],
              ['R', 'C', 'F', 'K', 'C', 'A', 'T'],
              ['D', 'K', 'B', 'A', 'E', 'Q', 'J'],
              ['F', 'I', 'S', 'H', 'U', 'Y', 'L']
            ], words: [
              "RABBIT",
              "MONKEY",
              "LION",
              "BIRD",
              "FISH",
              "CAT",
              "COW",
            ]));
    });

    final result = await crosswordFuture;
    return result;
  }
}
