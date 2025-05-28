import 'package:bloc_template/data/repository_impl/auth_repository_impl.dart';
import 'package:bloc_template/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc_template/data/services/auth_service.dart';
import 'package:bloc_template/domain/usecases/login_usecase.dart';
import 'package:bloc_template/domain/usecases/check_auth_status_usecase.dart';

final getIt = GetIt.instance;

void setup() {
  // Services
  getIt.registerLazySingleton<AuthService>(() => AuthService());

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt<AuthService>()));

  // UseCases
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton<CheckAuthStatusUseCase>(() => CheckAuthStatusUseCase(getIt<AuthRepository>()));
}
