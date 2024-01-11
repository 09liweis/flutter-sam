import 'package:flutter/material.dart';

import '../services/movie_service.dart';
import '../models/movie.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> movies = [];
  bool loading = false;

  Future<void> fetchMovies(endPoint) async {
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

  void addTask(Movie task) {
    movies.insert(0, task);
    // movies.add(task);
    notifyListeners();
  }

  void removeTaskAtIndex(int index) {
    movies.removeAt(index);
    notifyListeners();
  }
}
