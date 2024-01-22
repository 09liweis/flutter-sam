import 'package:fluttersam/models/movie.dart';

class MovieDetail extends Movie {
  String summary;
  MovieDetail(
      {super.id,
      super.title,
      super.poster,
      super.summaryAPI,
      super.doubanRating,
      super.imdbRating,
      super.episodes,
      super.currentEpisode,
      this.summary = ''});

  void setSummary(String movieSummary) {
    summary = movieSummary;
  }

  String getSummary() {
    return summary;
  }

  MovieDetail.fromJson(Map<String, dynamic> json)
      : summary = json['summary'],
        super.fromJson(json);
}
