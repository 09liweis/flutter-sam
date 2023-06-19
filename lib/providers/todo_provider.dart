import 'package:flutter/material.dart';

import '../services/todo_service.dart';
import '../models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> tasks = [];
  bool loading = false;

  Future<void> fetchTasks() async {
    loading = true;
    notifyListeners();
    try {
      tasks = await TodoService.fetchTasks();
    } catch (error) {
      throw Exception('Failed to fetch tasks: $error');
    }
    loading = false;
    notifyListeners();
  }

  void addTask(Todo task) {
    tasks.insert(0, task);
    // tasks.add(task);
    notifyListeners();
  }

  void removeTaskAtIndex(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
