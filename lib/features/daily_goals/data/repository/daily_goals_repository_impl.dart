import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:tododyst/features/clock_game/domain/repository/clock_level_repository.dart';
import 'package:tododyst/features/daily_goals/domain/repository.dart/daily_goals_repository.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../services/network/network_service.dart';

@LazySingleton(as: DailyGoalsRepository)
final class DailyGoalsRepositoryImpl implements DailyGoalsRepository {
  final NetworkService networkService;

  DailyGoalsRepositoryImpl({
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<String>>> getSkills(String module) {
    try {
      return Future.delayed(
          const Duration(milliseconds: 500),
          () => right(
                module == 'Self Care Skils'
                    ? ['Brushing Teeth', 'Washing Hands', 'Taking a Bath']
                    : module == 'Mathematic Skills'
                        ? ['Counting', 'Addition', 'Subtraction']
                        : ['Reading', 'Writing', 'Speaking'],
              ));
    } catch (e) {
      log(e.toString());
      return Future.value(left(Failure.unknownError(tr('unknown_error'))));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getModules() {
    // TODO: implement getModules

    try {
      return Future.delayed(
          const Duration(milliseconds: 500),
          () => right(
              ['Self Care Skils', 'Mathematic Skills', 'Language Skills']));
    } catch (e) {
      log(e.toString());
      return Future.value(left(Failure.unknownError(tr('unknown_error'))));
    }
  }
}
