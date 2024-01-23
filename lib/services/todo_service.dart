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

  static Future<Todo> addTodo(Todo todo) async {
    Map<String, String> todoRequest = {
      "name": todo.getName(),
      "date": todo.getDate(),
      "status": "pending"
    };
    final response = await ApiService.post('todos', todoRequest);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Todo.fromJson(jsonData);
    } else {
      throw Exception('Add task fail');
    }
  }

  static Future<dynamic> deleteTodo(Todo todo) async {
    final response = await ApiService.delete('todos/' + todo.getId());
    if (response.statusCode == 200) {
      return null;
    }
  }
}
