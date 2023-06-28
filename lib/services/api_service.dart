import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://samliweisen.onrender.com/api';

  static Future<http.Response> get(String endpoint) async {
    return await http.get(Uri.parse('$baseUrl/$endpoint'));
  }

  static Future<http.Response> post(String endpoint) async {
    return await http.post(Uri.parse('$baseUrl/$endpoint'), body: {});
  }
}
