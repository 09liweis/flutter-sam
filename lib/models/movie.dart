class Movie {
  final String id;
  final String title;
  final String poster;
  final double doubanRating;
  final int currentEpisode;
  final int episodes;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.doubanRating,
    required this.currentEpisode,
    required this.episodes,
  });

  bool isDone() {
    return currentEpisode == episodes;
  }

  String getId() {
    return id;
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['douban_id'],
        title: json['title'],
        poster: json['poster'],
        doubanRating: json['douban_rating'],
        currentEpisode: json['current_episode'],
        episodes: json['episodes']);
  }
}
