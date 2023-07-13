import 'dart:convert';
import 'package:fluttersam/services/api_service.dart';

import '../models/todo.dart';

class TodoService extends ApiService {
  static Future<List<Todo>> fetchTasks() async {
    final response = await ApiService.get('todos');
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return List<Todo>.from(jsonData.map((task) => Todo.fromJson(task)));
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  static Future<Todo> addTodo() async {
    final response = await ApiService.post('todos');
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Todo.fromJson(jsonData);
    } else {
      throw Exception('Add task fail');
    }
  }
}
