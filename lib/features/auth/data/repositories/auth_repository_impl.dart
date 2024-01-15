import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../services/locale/locale_resources_service.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final NetworkService networkService;
  final LocaleResourcesService localeResourcesService;

  AuthRepositoryImpl({required this.networkService, required this.localeResourcesService});

  @override
  Future<bool> isTokenExpired() async {
    final token = await localeResourcesService.getAccessToken();

    if (token.isNone()) return true;

    final isExpired = JwtDecoder.isExpired(token.toNullable()!);

    if (isExpired) {
      await localeResourcesService.clearSecureStorage();
    } else {
      log(token.toNullable() ?? "Token is null");
      networkService.setToken(token.toNullable()!);
    }

    return isExpired;
  }
}
