import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttersam/models/movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function(int) onPressed;

  const MovieList({super.key, required this.movies, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(movie: movie);
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Hero(
          tag: movie.id,
          child: Row(
            children: [
              MovieCardPoster(movie: movie),
              MovieCardInfo(movie: movie)
            ],
          ),
        ));
  }
}

class MovieCardInfo extends StatelessWidget {
  const MovieCardInfo({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Container(
          height: 160,
          padding: const EdgeInsets.only(left: 10),
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(movie.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            MovieCardInfoRating(movie: movie),
          ]),
        ));
  }
}

class MovieCardInfoRating extends StatelessWidget {
  const MovieCardInfoRating({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            movie.doubanRating.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MovieCardPoster extends StatelessWidget {
  const MovieCardPoster({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: CachedNetworkImage(
          imageUrl: movie.poster,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ));
  }
}
