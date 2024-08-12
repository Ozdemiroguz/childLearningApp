import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../services/network/network_service.dart';
import 'level_repository.dart';

@LazySingleton(as: LevelRepository)
final class LevelRepositoryImp implements LevelRepository {
  final NetworkService networkService;

  LevelRepositoryImp({
    required this.networkService,
  });

  @override
  Future<Either<Failure, int>> getLevel(
    String gameType,
  ) {
    try {
      return Future.delayed(const Duration(milliseconds: 500), () => right(4));
    } catch (e) {
      log(e.toString());
      return Future.value(left(Failure.unknownError(tr('unknown_error'))));
    }
  }
}
