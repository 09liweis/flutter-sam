import 'dart:convert';
import 'package:fluttersam/services/api_service.dart';

import '../models/movie.dart';

class MovieService extends ApiService {
  static Future<List<Movie>> fetchMovies() async {
    final response = await ApiService.get('movies?limit=100');
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return List<Movie>.from(
          jsonData['movies'].map((task) => Movie.fromJson(task)));
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}
