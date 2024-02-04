import 'package:fluttersam/models/movie.dart';

class MovieDetail extends Movie {
  String summary;
  List<String> languages;
  MovieDetail(
      {super.id,
      super.title,
      super.poster,
      super.summaryAPI,
      super.doubanRating,
      super.imdbRating,
      super.episodes,
      super.currentEpisode,
      this.summary = '',
      this.languages = const []});

  void setSummary(String movieSummary) {
    summary = movieSummary;
  }

  String getSummary() {
    return summary;
  }

  MovieDetail.fromJson(Map<String, dynamic> json)
      : summary = json['summary'] ?? '',
        languages = json['languages'],
        super.fromJson(json);
}
