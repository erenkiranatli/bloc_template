abstract class AuthRepository {
  Future<bool> login({required String email, required String password});
  Future<bool> isLoggedIn();
}
