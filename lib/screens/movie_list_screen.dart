import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/movie_list.dart';
import '../providers/todo_provider.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MainProvider>(context);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (movieProvider.movies.isEmpty) {
        movieProvider.fetchMovies("");
      }
    });

    List<String> categories = [
      'My Movies',
      'imdb_boxoffice',
      'popular',
      'in_theatre',
      'comming',
      'chart'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('What I Watched'),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) =>
                    buildCategory(categories, index, context)),
          ),
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

  Padding buildCategory(
      List<String> categories, int index, BuildContext context) {
    final movieProvider = Provider.of<MainProvider>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
            onTap: () {
              movieProvider.fetchMovies(categories[index]);
            },
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                categories[index],
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              )
            ])));
  }
}
