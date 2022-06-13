import 'package:flutter/material.dart';

import '../database/movie_list_constant.dart';
import '../models/movie_model.dart';

class ClassTikTok extends StatefulWidget {
  ClassTikTok({Key? key}) : super(key: key);

  @override
  State<ClassTikTok> createState() => _ClassTikTokState();
}

class _ClassTikTokState extends State<ClassTikTok> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _bulidiconbottom(),
    );
  }

  Widget _buildBody() {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildItem(movieList[index]);
      },
    );
  }

  Widget _buildItem(MovieModel item) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.network(
            item.image,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(top: 340, left: 340, child: _bulidiconright()),
      ],
    );
  }

  Widget _bulidiconright() {
    return Column(
      children: [
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.message,
              color: Colors.white,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            )),
      ],
    );
  }

  Widget _bulidiconbottom() {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.home,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.message,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.person,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
