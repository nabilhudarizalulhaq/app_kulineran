
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<String?> login(String email, String password) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token);

      return token;
    } else {
      final error = jsonDecode(response.body)['message'];
      throw Exception(error ?? 'Login failed');
    }
  }
}

