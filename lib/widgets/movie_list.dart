import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttersam/models/movie.dart';
import '../screens/add_todo_page.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function(int) onPressed;

  MovieList({required this.movies, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          onTap: () => {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => AddTodoScreen()))
          },
          leading: CachedNetworkImage(
            imageUrl: movie.poster,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: Text(
            movie.title,
            style: TextStyle(
                decoration: (movie.isDone())
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          subtitle: Text(
            movie.doubanRating.toString(),
            style: const TextStyle(color: Colors.cyan, fontSize: 15),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.green,
              size: 30,
            ),
            onPressed: () {
              onPressed(index);
            },
          ),
        );
      },
    );
  }
}
