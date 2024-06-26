import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttersam/models/movie.dart';
import 'package:fluttersam/providers/app_provider.dart';
import 'package:fluttersam/screens/movies/movie_detail_screen.dart';
import 'package:provider/provider.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({super.key, required this.movies});

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
    final movieProvider = Provider.of<MainProvider>(context);
    var movieHero = Hero(
      tag: movie.getId(),
      child: Row(
        children: [MovieCardPoster(movie: movie), MovieCardInfo(movie: movie)],
      ),
    );
    return Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            movieProvider.setMovie(movie);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MovieDetailScreen()));
          },
          child: movieHero,
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
                Text(movie.getTitle(),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      backgroundColor: Colors.white,
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
        decoration: const BoxDecoration(
            color: Color(0xff028e07),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: const EdgeInsets.all(5),
        child: Text(
          movie.getIMDBRating(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
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
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: ImageWrapper(imageUrl: movie.getPoster()),
        ));
  }
}

class ImageWrapper extends StatelessWidget {
  const ImageWrapper({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
