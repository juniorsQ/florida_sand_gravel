import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florida_sand_gravel/features/auth/domain/usecases/register_user.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUser _registerUser; // Inyecta el caso de uso

  RegisterCubit({RegisterUser? registerUser}) : _registerUser = registerUser ?? RegisterUser(), super(RegisterInitial());

  Future<void> register(String name, String email, String password) async {
    emit(RegisterLoading());
    try {
      await _registerUser.execute(name, email, password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
  }
}