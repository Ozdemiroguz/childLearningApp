import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';

abstract interface class DailyGoalsRepository {
  Future<Either<Failure, List<String>>> getModules();
  Future<Either<Failure, List<String>>> getSkills(String module);
}
