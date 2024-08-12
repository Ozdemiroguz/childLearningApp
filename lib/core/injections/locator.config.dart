// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i13;

import 'package:cross_connectivity/cross_connectivity.dart' as _i8;
import 'package:dio/dio.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i30;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i29;
import '../../features/clock_game/data/repository.dart/clock_level_repository_imp.dart'
    as _i26;
import '../../features/clock_game/domain/repository/clock_level_repository.dart'
    as _i25;
import '../../features/crossword/data/repositories/crossword_repository_impl.dart'
    as _i32;
import '../../features/crossword/domain/repositories/crosword_repository.dart'
    as _i31;
import '../../features/daily_goals/data/repository/daily_goals_repository_impl.dart'
    as _i24;
import '../../features/daily_goals/domain/repository.dart/daily_goals_repository.dart'
    as _i23;
import '../../features/memory_game/data/repositories/memory_game_repository_impl.dart'
    as _i20;
import '../../features/memory_game/domain/repositories/memory_game_repository.dart'
    as _i19;
import '../../features/profile/data/repository/user_repository_impl.dart'
    as _i22;
import '../../features/profile/domain/repository/user_repository.dart' as _i21;
import '../../router/router.dart' as _i7;
import '../../services/jwt/jwt_service.dart' as _i15;
import '../../services/jwt/jwt_service_impl.dart' as _i16;
import '../../services/level/level_repository.dart' as _i27;
import '../../services/level/level_repository_impl.dart' as _i28;
import '../../services/locale/locale_resources_service.dart' as _i3;
import '../../services/locale/locale_resources_service_impl.dart' as _i4;
import '../../services/network/network_info.dart' as _i10;
import '../../services/network/network_info_impl.dart' as _i11;
import '../../services/network/network_service.dart' as _i17;
import '../../services/network/network_service_impl.dart' as _i18;
import '../models/usecases/base_64_encode.dart' as _i14;
import '../models/usecases/usecase.dart' as _i12;
import 'register_module.dart' as _i33;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.LocaleResourcesService>(
        () => _i4.LocaleResourcesServiceImpl(
              secureStorage: gh<_i5.FlutterSecureStorage>(),
              sharedPreferences: gh<_i6.SharedPreferences>(),
            ));
    gh.lazySingleton<_i7.AppRouter>(() => registerModule.appRouter);
    gh.lazySingleton<_i8.Connectivity>(() => registerModule.connectivity);
    await gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i9.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i10.NetworkInfo>(
        () => _i11.NetworkInfoImpl(connectivity: gh<_i8.Connectivity>()));
    gh.lazySingleton<_i12.UseCase<String, _i13.Uint8List>>(
        () => const _i14.Base64Encode());
    gh.lazySingleton<_i15.JwtService>(() => _i16.JwtServiceImpl());
    gh.lazySingleton<_i17.NetworkService>(() => _i18.NetworkServiceImpl(
          gh<_i9.Dio>(),
          localeResourcesService: gh<_i3.LocaleResourcesService>(),
          networkInfo: gh<_i10.NetworkInfo>(),
        ));
    gh.lazySingleton<_i19.MemoryGameRepository>(() =>
        _i20.MemoryGameRepositoryImpl(
            networkService: gh<_i17.NetworkService>()));
    gh.lazySingleton<_i21.UserRepository>(() =>
        _i22.UserRepositoryImp(networkService: gh<_i17.NetworkService>()));
    gh.lazySingleton<_i23.DailyGoalsRepository>(() =>
        _i24.DailyGoalsRepositoryImpl(
            networkService: gh<_i17.NetworkService>()));
    gh.lazySingleton<_i25.ClockLevelRepository>(() =>
        _i26.ClockLevelRepositoryImp(
            networkService: gh<_i17.NetworkService>()));
    gh.lazySingleton<_i27.LevelRepository>(() =>
        _i28.LevelRepositoryImp(networkService: gh<_i17.NetworkService>()));
    gh.lazySingleton<_i29.AuthRepository>(() => _i30.AuthRepositoryImpl(
          networkService: gh<_i17.NetworkService>(),
          localeResourcesService: gh<_i3.LocaleResourcesService>(),
        ));
    gh.lazySingleton<_i31.CrosswordRepository>(() =>
        _i32.CrosswordRepositoryImpl(
            networkService: gh<_i17.NetworkService>()));
    return this;
  }
}

class _$RegisterModule extends _i33.RegisterModule {
  @override
  _i7.AppRouter get appRouter => _i7.AppRouter();

  @override
  _i8.Connectivity get connectivity => _i8.Connectivity();
}
