class Movie {
  final String id;
  final String title;
  final String poster;
  double doubanRating;
  double imdbRating;
  final int currentEpisode;
  final int episodes;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.doubanRating,
    required this.imdbRating,
    required this.currentEpisode,
    required this.episodes,
  });

  bool isDone() {
    return currentEpisode == episodes;
  }

  String getId() {
    return id;
  }

  String getTitle() {
    return title;
  }

  String getPoster() {
    return poster;
  }

  String getDoubanRating() {
    return doubanRating.toString();
  }

  String getIMDBRating() {
    return imdbRating.toString();
  }

  String getType() {
    return episodes == 1 ? 'movie' : 'tv';
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['_id'] ?? json['douban_id'] ?? json['imdb_id'] ?? '',
        title: json['title'],
        poster: json['poster'],
        doubanRating: json['douban_rating'] ?? 0,
        imdbRating: json['imdb_rating'] ?? 0,
        currentEpisode: json['current_episode'] ?? 0,
        episodes: json['episodes'] ?? 0);
  }
}
