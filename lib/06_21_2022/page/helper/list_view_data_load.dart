import 'package:flutter/material.dart';

import '../../database/movie_list_constant.dart';
import '../../model/movie_model.dart';

//List View Data

List<Widget> listViewDataLoad(List<MovieModel> movieList) {
  return movieList.map((movie) {
    String moviepic = movie.image;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              moviepic,
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
              left: 200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 160,
                    child: Text(
                      movie.des,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "More Info",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }).toList();
}

//Scroll View Data

List<Widget> scrollbleBlock(List<MovieModel> movieList) {
  return movieList.map((movie) {
    String moviepic = movie.image;
    String moviename = movie.title;
    return Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              moviepic,
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                width: 200,
                child: Text(
                  moviename,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ));
  }).toList();
}

Widget seemore = Card(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  child: InkWell(
      onTap: () {
        addData();
      },
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "See more",
          style: TextStyle(fontSize: 20),
        ),
      )),
);
