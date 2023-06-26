import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/movie_list.dart';
import '../providers/todo_provider.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MainProvider>(context);
    // if (movieProvider.movies.isEmpty) {
    //   movieProvider.fetchMovies(); //TODO: EXCEPTION CAUGHT
    // }

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
                    )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                movieProvider.fetchMovies();
              },
              child: const Text('Fetch Movies'),
            ),
          ),
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
