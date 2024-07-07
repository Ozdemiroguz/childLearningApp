import 'dart:developer';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../../constants/failure_message.dart';
import '../../../../core/models/failure/failure.dart';
import '../../../../services/locale/locale_resources_service.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final NetworkService networkService;
  final LocaleResourcesService localeResourcesService;

  AuthRepositoryImpl({
    required this.networkService,
    required this.localeResourcesService,
  });

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

  @override
  Future<Option<Failure>> login({
    required String username,
    required String password,
  }) async {
    final result = await networkService.post(
      Endpoints.login,
      data: {
        "password": password,
        "email": username,
      },
    );
    return result.fold(
      (l) => some(Failure.auth(l.message)),
      (r) => optionOf(r.data).fold(
        () => some(Failure.unknownError(unknownErrorMessage)),
        (data) async {
          // token'ı data'dan çıkartalım
          final token = data['token'] as String?;

          if (token == null || token.isEmpty) {
            print("Token mevcut değil veya boş");
            return some(Failure.unknownError(unknownErrorMessage));
          }

          try {
            log("accessToken: $token");
            networkService.setToken(token);

            await localeResourcesService.setAccessToken(token);

            return none();
          } catch (e) {
            print("Hata: $e");
            return some(Failure.unknownError(unknownErrorMessage));
          }
        },
      ),
    );
  }

  @override
  Future<Option<Failure>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final result = await networkService.post(
      Endpoints.register,
      data: {
        "password": password,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      },
    );
    return result.fold(
      (l) => some(Failure.auth(l.message)),
      (r) => none(),
    );
  }
}
