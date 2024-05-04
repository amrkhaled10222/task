abstract class TokenService {
  String? get getAuthToken;
  String? get getRefreshToken;

  Future<void> setAuthToken(String token);

  String? getToken();

  Future<bool> clearAuthToken();

  bool isAlreadyLoggedIn();
}
