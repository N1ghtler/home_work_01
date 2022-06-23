import 'package:flutter/material.dart';

import '../../Class/models/movie_model.dart';

List<Widget> scrollbleBlock(List<MovieModel> movieList) {
  return movieList.map((movie) {
    String moviepic = movie.image;
    return Card(
      child: Image.network(
        moviepic,
        width: 200,
        height: 200,
      ),
    );
  }).toList();
}
