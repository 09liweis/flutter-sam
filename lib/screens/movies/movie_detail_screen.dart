import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fluttersam/models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.getTitle())),
      body: Text("Movie Detail Screen"),
    );
  }
}
