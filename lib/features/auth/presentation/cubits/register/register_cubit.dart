import 'package:florida_sand_gravel/features/auth/domain/entities/user_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florida_sand_gravel/features/auth/data/repositories/register_repository.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/register/register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository? _registerUser; // Inyecta el repositorio

  RegisterCubit({RegisterRepository? registerRepository}) 
      : _registerUser = registerRepository, 
        super(RegisterInitial());

  Future<void> register({
    required String name,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String truckNumber,
    required int transportDivisionId,
    required String password,
    required String repeatPassword,
  }) async {
    emit(RegisterLoading());

    try {
      if (password != repeatPassword) {
        throw Exception("Las contraseñas no coinciden.");
      }

      await _registerUser?.registerUser(name, lastName, email, phoneNumber, truckNumber, transportDivisionId, password,repeatPassword
      );

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
  }
}