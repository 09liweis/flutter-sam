import 'package:flutter/material.dart';
import 'package:fluttersam/models/movie.dart';
import 'package:fluttersam/providers/app_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailScreen> {
  Movie movie = Movie();
  @override
  void initState() {
    super.initState();
    Provider.of<MainProvider>(context, listen: false).fetchMovieSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.getTitle())),
      body: Center(
        child: Text(movie.getSummaryAPI()),
      ),
    );
  }
}
