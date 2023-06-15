import 'package:flutter/material.dart';

import '../services/todo_service.dart';
import '../models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Task> tasks = [];

  Future<void> fetchTasks() async {
    try {
      tasks = await TodoService.fetchTasks();
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to fetch tasks: $error');
    }
  }

  void addTask(Task task) {
    tasks.insert(0, task);
    // tasks.add(task);
    notifyListeners();
  }

  void removeTaskAtIndex(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
