class AuthService {
  Future<bool> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1)); //Http request

    if (email == "eren@gmail.com" && password == "123") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    //token check
    return false;
  }
}
