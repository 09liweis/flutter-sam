import 'dart:convert';

import 'package:fluttersam/utils/share_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://samliweisen.onrender.com/api';

  static void getAPIRoutes() async {
    var response = await get('');
    SharedPreferencesHelper.setAPIRoutes(jsonDecode(response.body));
  }

  static Future<http.Response> get(String endpoint) async {
    Map apiRoutes = await SharedPreferencesHelper.getAPIRoutes();
    return await http.get(Uri.parse('$baseUrl/$endpoint'));
  }

  static Future<http.Response> post(
      String endpoint, Map<String, String> body) async {
    print('$baseUrl/$endpoint');
    return await http.post(Uri.parse('$baseUrl/$endpoint'), body: body);
  }
}
