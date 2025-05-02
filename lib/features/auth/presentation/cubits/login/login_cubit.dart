import 'package:florida_sand_gravel/features/auth/data/repositories/auth_repository.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginCubit extends Cubit<LoginState> {
//   final AuthRepository _authRepository;

//   LoginCubit({required AuthRepository authRepository}) : _authRepository = authRepository, super(LoginInitial());

//   Future<AuthResponse> execute(String email, String password) async {
//     return await _authRepository.login(email, password);
//   }
// }

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository}) 
      : _authRepository = authRepository, super(LoginInitial());

  Future<void> execute(String email, String password) async {
    emit(LoginLoading()); // 🔄 Estado de carga

    try {
      final authResponse = await _authRepository.login(email, password);
      emit(LoginSuccess(authResponse)); //  Si el login es exitoso, emit ok
    } catch (e) {
      //emit(LoginFailure(error: e.toString())); //  Si no emit error JuniorsQ
      emit(LoginFailure(error: "Login fallido")); //  Si no emit error JuniorsQ
    }
  }
}
