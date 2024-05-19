import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl;

  HttpService({this.baseUrl = "http://localhost/"});

  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<dynamic> postRequest(String endpoint, dynamic data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to send data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
