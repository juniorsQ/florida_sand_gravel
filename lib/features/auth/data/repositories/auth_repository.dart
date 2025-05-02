import 'package:dio/dio.dart';
import 'package:florida_sand_gravel/features/auth/domain/entities/user.dart';

class AuthRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://apidev.flsandgravel.com"));

  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await _dio.post("/api/v1/auth", data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: "Error en el servidor: ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      throw Exception("Error de red: ${e.message}");
    } catch (e) {
      throw Exception("Error inesperado: $e");
    }
  }
}