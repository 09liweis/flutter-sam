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
        return Card(
          elevation: 5,
          child: Row(
            children: [
              CachedNetworkImage(
                width: 100,
                imageUrl: movie.poster,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              // Hero(
              //     tag: movie.id,
              //     child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //               bottomLeft: Radius.circular(15),
              //               topLeft: Radius.circular(15)),
              //         ),
              //         child: CachedNetworkImage(
              //           width: 100,
              //           imageUrl: movie.poster,
              //           placeholder: (context, url) =>
              //               const CircularProgressIndicator(),
              //           errorWidget: (context, url, error) =>
              //               const Icon(Icons.error),
              //         ))),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 200,
                          child: Text(movie.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ))),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.green,
                        padding: EdgeInsets.all(10),
                        width: 200,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            movie.doubanRating.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        );
      },
    );
  }
}
