import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/movie_list.dart';
import '../providers/todo_provider.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MainProvider>(context);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (movieProvider.movies.isEmpty) {
        movieProvider.fetchMovies();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('What I Watched'),
      ),
      body: Column(
        children: [
          Expanded(
              child: movieProvider.loading
                  ? const Center(child: CircularProgressIndicator())
                  : MovieList(
                      movies: movieProvider.movies,
                      onPressed: movieProvider.removeTaskAtIndex,
                    ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => AddMovieScreen()))
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
