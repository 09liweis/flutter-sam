import 'dart:convert';
import 'package:fluttersam/models/movie_detail.dart';
import 'package:fluttersam/services/api_service.dart';

import '../models/movie.dart';

class MovieService extends ApiService {
  static Future<List<Movie>> fetchMovies(endPoint) async {
    endPoint ??= "";
    final response = await ApiService.get("movies/" + endPoint);
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

  static Future<MovieDetail> fetchMovieDetail(summaryAPI) async {
    try {
      final response = await ApiService.get(summaryAPI);
      return MovieDetail.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
