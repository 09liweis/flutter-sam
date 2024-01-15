import 'dart:convert';

import 'package:fluttersam/utils/share_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://samliweisen.onrender.com/api';

  static void getAPIRoutes() async {
    var response = await get('');
    SharedPreferencesHelper.setAPIRoutes(jsonDecode(response.body));
  }

  static Uri getParseUri(String endPoint) {
    return Uri.parse('$baseUrl/$endPoint');
  }

  static Future<http.Response> get(String endpoint) async {
    Map apiRoutes = await SharedPreferencesHelper.getAPIRoutes();
    return await http.get(getParseUri(endpoint));
  }

  static Future<http.Response> post(
      String endpoint, Map<String, String> body) async {
    return await http.post(getParseUri(endpoint), body: body);
  }
}
