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
            child: Hero(
              tag: movie.id,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: CachedNetworkImage(
                        imageUrl: movie.poster,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                      width: 230,
                                      child: Text(movie.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.green,
                                      padding: EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          movie.doubanRating.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ))
                ],
              ),
            ));
      },
    );
  }
}
