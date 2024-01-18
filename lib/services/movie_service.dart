import 'dart:convert';
import 'package:fluttersam/services/api_service.dart';

import '../models/movie.dart';

class MovieService extends ApiService {
  static Future<List<Movie>> fetchMovies(endPoint) async {
    endPoint ??= "";
    final response = await ApiService.get("movies/" + endPoint + "?limit=100");
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        return List<Movie>.from(
            jsonData['movies'].map((task) => Movie.fromJson(task)));
      } catch (e) {
        throw Exception('Failed to fetch tasks');
      }
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}
