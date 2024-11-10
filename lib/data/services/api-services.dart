import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = '127.0.0.1:8000/api';

  // GET request
  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    final url = Uri.parse('$_baseUrl/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  //  POST request
  Future<Map<String, dynamic>> postData(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}
