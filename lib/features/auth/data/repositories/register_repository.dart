import 'package:dio/dio.dart';
import 'package:florida_sand_gravel/features/auth/domain/entities/user_register.dart';
import 'package:flutter/widgets.dart';

class RegisterRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://apidev.flsandgravel.com"));

//   Future<void> registerUser(String name, String email, String password) async {
//     try {
//       final response = await _dio.post("/api/v1/auth/signup-drivers", data: user.toJson());
//       print("Registro exitoso: ${response.data}");
//     } catch (e) {
//       print("Error en el registro: $e");
//     }
//   }
// }

Future<void> registerUser(
  String name,
  String lastName,
  String email,
  String phoneNumber,
  String truckNumber,
  int transportDivisionId,
  String password,
  String repeatPassword,
) async {
  try {
    final response = await _dio.post("/api/v1/auth/signup-drivers", data: {
      "name": name,
      "lastName": lastName, 
      "email": email,
      "phoneNumber": phoneNumber, 
      "truckNumber": truckNumber, 
      "transportDivisionId": transportDivisionId, 
      "password": password,
      "repeatPassword": repeatPassword,
    });

    print("Registro exitoso: ${response.data}");
  } catch (e) {
    print("Error en el registro: $e");
  }
}

  } 