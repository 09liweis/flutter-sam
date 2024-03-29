import 'package:flutter/material.dart';
import 'package:fluttersam/providers/app_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MainProvider>(context, listen: false).fetchMovieSummary();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MainProvider>(context);
    final movie = movieProvider.movie;
    final movieDetail = movieProvider.movieDetail;
    final loading = movieProvider.loading;
    return Scaffold(
      appBar: AppBar(title: Text(movie.getTitle())),
      body: Column(children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Text(movieDetail.getSummary()),
        ))
      ]),
    );
  }
}
