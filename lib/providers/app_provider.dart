import 'package:flutter/material.dart';
import 'package:fluttersam/models/expense_statistics.dart';
import 'package:fluttersam/models/movie_detail.dart';
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
      fetchTasks();
    } catch (e) {}
    notifyListeners();
  }

  void removeTaskAtIndex(Todo todo) async {
    await TodoService.deleteTodo(todo);
    fetchTasks();
  }

  List<Movie> movies = [];
  String curMovieCategory = '';
  Movie movie = Movie();
  MovieDetail movieDetail = MovieDetail();

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

  void setMovie(Movie curMovie) {
    movie = curMovie;
  }

  Future<void> fetchMovieSummary() async {
    loading = true;
    notifyListeners();
    try {
      movieDetail = await MovieService.fetchMovieDetail(movie.getSummaryAPI());
    } catch (e) {
      print(e);
    }
    loading = false;
    notifyListeners();
  }

  ExpenseStatistics es = ExpenseStatistics();

  Future<void> fetchStatistic() async {
    es = await ExpenseService.fetchStatistic();
    notifyListeners();
  }
}
