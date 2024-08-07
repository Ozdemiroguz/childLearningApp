import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:tododyst/core/injections/locator.config.dart';
import 'package:tododyst/features/clock_game/domain/repository/clock_level_repository.dart';
import 'package:tododyst/features/daily_goals/domain/repository.dart/daily_goals_repository.dart';
import 'package:tododyst/features/profile/domain/repository/user_repository.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/crossword/domain/repositories/crosword_repository.dart';
import '../../router/router.dart';
import '../../services/locale/locale_resources_service.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() => getIt.init();

final appRouterProvider = Provider.autoDispose((ref) => getIt<AppRouter>());

final localeResourcesServiceProvider =
    Provider.autoDispose((ref) => getIt<LocaleResourcesService>());

final authRepositoryProvider =
    Provider.autoDispose((ref) => getIt<AuthRepository>());

final crosswordRepositoryProvider =
    Provider.autoDispose((ref) => getIt<CrosswordRepository>());

final clockLevelRepositoryProvider =
    Provider.autoDispose((ref) => getIt<ClockLevelRepository>());

final dailyGoalsRepositoryProvider =
    Provider.autoDispose((ref) => getIt<DailyGoalsRepository>());

final userRepositoryProvider =
    Provider.autoDispose((ref) => getIt<UserRepository>());
