import 'package:flutter/material.dart';
import 'package:fluttersam/services/expense_service.dart';

import '../services/todo_service.dart';
import '../models/todo.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MainProvider extends ChangeNotifier {
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

  List<Movie> movies = [];

  Future<void> fetchMovies() async {
    loading = true;
    notifyListeners();
    try {
      movies = await MovieService.fetchMovies();
    } catch (error) {
      throw Exception('Failed to fetch movies: $error');
    }
    loading = false;
    notifyListeners();
  }

  Future<void> fetchStatistic() async {
    await ExpenseService.fetchStatistic();
  }
}
