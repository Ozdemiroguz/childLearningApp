import 'package:fpdart/fpdart.dart';
import 'package:tododyst/features/crossword/domain/models/word_data.dart';

import '../../../../core/models/failure/failure.dart';

abstract interface class CrosswordRepository {
  Future<Either<Failure, WordData>> getCrosswords(int sectionId);
}
