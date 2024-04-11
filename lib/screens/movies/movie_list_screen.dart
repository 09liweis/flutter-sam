import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/movie_list.dart';
import '../../providers/app_provider.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MainProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (movieProvider.movies.isEmpty) {
        movieProvider.fetchMovies("");
      }
    });

    List<Map<String, String>> categories = [
      {'url': '', 'tl': 'My Movies'},
      {'url': 'cineplex', 'tl': 'Cineplex'},
      {'url': 'hongkong/coming', 'tl': 'Hongkong'},
      {'url': 'imdb/boxoffice', 'tl': 'IMDB'},
      {'url': 'douban/popular', 'tl': 'Popular'},
      {'url': 'douban/in_theatre', 'tl': 'In theatre'},
      {'url': 'douban/comming', 'tl': 'Comming Soon'},
      {'url': 'douban/chart', 'tl': 'Douban Chart'}
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('What I Watched'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) =>
                    buildCategory(categories[index], index, context)),
          ),
          Expanded(
              child: movieProvider.loading
                  ? const Center(child: CircularProgressIndicator())
                  : MovieList(movies: movieProvider.movies))
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
      Map<String, String> category, int index, BuildContext context) {
    final movieProvider = Provider.of<MainProvider>(context);
    bool indicateWidth = movieProvider.curMovieCategory == category['url'];
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
            onTap: () {
              movieProvider.fetchMovies(category['url']);
            },
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                category['tl'] ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: indicateWidth ? 40 : 0,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              )
            ])));
  }
}
