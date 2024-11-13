import 'dart:convert';
import 'package:apps_kulineran/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final String apiUrl;

  LoginService({required this.apiUrl});

  Future<LoginResponse?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return LoginResponse.fromJson(data);
      } else {
        ('Login failed with status: ${response.statusCode}');
        ('Response body: ${response.body}');
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      ('Error occurred: $e');
      throw Exception('An error occurred during login: $e');
    }
  }
}
