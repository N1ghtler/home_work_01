import 'package:flutter/material.dart';

import '../database/movie_list_constant.dart';
import '../model/movie_model.dart';

class MutiViewPage extends StatelessWidget {
  MutiViewPage({Key? key}) : super(key: key);

  List<MovieModel> movieListData = movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildappbar(),
      body: _builtbodymutiviewpage(),
    );
  }

  AppBar _buildappbar() {
    return AppBar(
      title: Text("Muti List Views"),
    );
  }

  Widget _builtbodymutiviewpage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _buildscrollbleverview(movieListData),
          const SizedBox(
            height: 20,
          ),
          _buildscrollbleverviewwithtitle(movieListData),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

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

  Widget seemore = const Card(
    child: InkWell(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "See more",
        style: TextStyle(fontSize: 20),
      ),
    )),
  );

  Widget _buildscrollbleverview(List<MovieModel> movieList) {
    List<Widget> data = scrollbleBlock(movieList);
    data.add(seemore);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: data),
    );
  }

  Widget _buildscrollbleverviewwithtitle(List<MovieModel> movieList) {
    List<Widget> data = scrollbleBlock(movieList);
    data.add(seemore);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 25, bottom: 10),
          child: Text(
            "Hello Title",
            style: TextStyle(
                fontSize: 30,
                color: Colors.pink,
                decoration: TextDecoration.underline),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: data,
          ),
        ),
      ],
    );
  }

  Widget _buildlistview() {
    return SingleChildScrollView(
      child: ListView(
        children: scrollbleBlock(movieListData),
      ),
    );
  }
}
