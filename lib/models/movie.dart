class Movie {
  String id;
  String title;
  String poster;
  double doubanRating;
  double imdbRating;
  int currentEpisode;
  int episodes;
  String summaryAPI;

  Movie(
      {this.id = '',
      this.title = '',
      this.poster = '',
      this.doubanRating = 0,
      this.imdbRating = 0,
      this.currentEpisode = 0,
      this.episodes = 0,
      this.summaryAPI = ''});

  bool isDone() {
    return currentEpisode == episodes;
  }

  String getId() {
    return id;
  }

  void setId(String movieId) {
    id = movieId;
  }

  String getTitle() {
    return title;
  }

  void setTitle(String movieTitle) {
    title = movieTitle;
  }

  String getPoster() {
    return poster;
  }

  void setPoster(String moviePoster) {
    poster = moviePoster;
  }

  String getDoubanRating() {
    return doubanRating.toString();
  }

  void setDoubanRating(double movieDoubanRating) {
    doubanRating = movieDoubanRating;
  }

  String getIMDBRating() {
    return imdbRating.toString();
  }

  void setIMDBRating(double movieIMDBRating) {
    imdbRating = movieIMDBRating;
  }

  String getType() {
    return episodes == 1 ? 'movie' : 'tv';
  }

  void setEpisodes(int movieEpisodes) {
    episodes = movieEpisodes;
  }

  String getSummaryAPI() {
    return summaryAPI;
  }

  void setSummaryAPI(String movieSummaryAPI) {
    summaryAPI = movieSummaryAPI;
  }

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['_id'] ?? json['douban_id'] ?? json['imdb_id'],
        title = json['title'] ?? '',
        poster = json['poster'] ?? '',
        doubanRating = json['douban_rating'] ?? 0,
        imdbRating = json['imdb_rating'] ?? 0,
        episodes = json['episodes'] ?? 0,
        currentEpisode = json['current_episodes'] ?? 0,
        summaryAPI = json['apis']?['summary'] ?? '';
}
