import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:tododyst/features/clock_game/domain/repository/clock_level_repository.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../services/network/network_service.dart';

@LazySingleton(as: ClockLevelRepository)
final class ClockLevelRepositoryImp implements ClockLevelRepository {
  final NetworkService networkService;

  ClockLevelRepositoryImp({
    required this.networkService,
  });

  @override
  Future<Either<Failure, int>> getLevel() {
    try {
      return Future.delayed(const Duration(milliseconds: 500), () => right(1));
    } catch (e) {
      log(e.toString());
      return Future.value(left(Failure.unknownError(tr('unknown_error'))));
    }
  }
}
