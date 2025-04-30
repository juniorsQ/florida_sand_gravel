import 'package:florida_sand_gravel/features/auth/domain/entities/user.dart';
import 'package:florida_sand_gravel/features/auth/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository _authRepository;

  LoginUser({required AuthRepository authRepository}) : _authRepository = authRepository;

  Future<User> execute(String email, String password) async {
    return await _authRepository.login(email, password);
  }
}