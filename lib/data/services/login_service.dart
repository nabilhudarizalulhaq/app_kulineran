import 'dart:convert';

import 'package:apps_kulineran/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final String baseUrl = "http://127.0.0.1:8000/api"; // API base URL

  Future<User?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return User.fromJson(jsonResponse);
      } else if (response.statusCode == 422) {
        print("Validation failed: ${response.body}");
      } else {
        print("Error: ${response.body}");
      }
    } catch (e) {
      print("Something went wrong: $e");
    }
    return null;
  }
}
