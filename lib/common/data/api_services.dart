import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // ... otros métodos HTTP (put, delete, etc.)

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error en la API: ${response.statusCode} - ${response.body}');
    }
  }
}