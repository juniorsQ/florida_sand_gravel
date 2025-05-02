import 'package:dio/dio.dart';
import 'package:florida_sand_gravel/features/auth/domain/entities/user_register.dart';

class RegisterRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.example.com"));

  Future<void> registerUser(UserRegister user, String email, String password) async {
    try {
      final response = await _dio.post("/api/v1/auth/signup-drivers", data: user.toJson());
      print("Registro exitoso: ${response.data}");
    } catch (e) {
      print("Error en el registro: $e");
    }
  }
}