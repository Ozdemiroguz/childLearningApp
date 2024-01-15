abstract interface class AuthRepository {
  Future<bool> isTokenExpired();
}
