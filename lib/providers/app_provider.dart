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

  Future<void> addTask(Todo task) async {
    try {
      Todo addedTodo = await TodoService.addTodo(task);
      tasks.add(addedTodo);
    } catch (e) {}
    notifyListeners();
  }

  void removeTaskAtIndex(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  List<Movie> movies = [];
  String curMovieCategory = '';

  Future<void> fetchMovies(endPoint) async {
    curMovieCategory = endPoint;
    loading = true;
    notifyListeners();
    try {
      movies = await MovieService.fetchMovies(endPoint);
    } catch (error) {
      throw Exception('Failed to fetch movies: $error');
    }
    loading = false;
    notifyListeners();
  }

  Future<void> fetchMovieSummary(Movie movie) async {}

  Future<void> fetchStatistic() async {
    await ExpenseService.fetchStatistic();
  }
}
