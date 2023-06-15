import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/todo.dart';

class TodoService {
  static const String baseUrl = 'https://samliweisen.onrender.com/api';

  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return List<Task>.from(jsonData.map((task) => Task.fromJson(task)));
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}
