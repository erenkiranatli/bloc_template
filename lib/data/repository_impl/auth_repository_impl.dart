import 'package:bloc_template/data/services/auth_service.dart';
import 'package:bloc_template/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<bool> login({required String email, required String password}) {
    return _authService.login(email: email, password: password);
  }

  @override
  Future<bool> isLoggedIn() {
    return _authService.isLoggedIn();
  }
}
