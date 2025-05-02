import 'package:florida_sand_gravel/features/auth/domain/entities/user_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florida_sand_gravel/features/auth/data/repositories/register_repository.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/register/register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository ? _registerUser; // Inyecta el caso de uso

  RegisterCubit({RegisterRepository? registerRepository}) : _registerUser = registerRepository, super(RegisterInitial());

  Future<void> register(String name, String email, String password) async {
    emit(RegisterLoading());
    try {
      await _registerUser!.registerUser(name as UserRegister, email, password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
  }
}