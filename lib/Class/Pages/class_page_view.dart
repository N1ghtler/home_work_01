import 'package:flutter/material.dart';

import '../database/movie_list_constant.dart';
import '../models/movie_model.dart';

class ClassPageView extends StatelessWidget {
  const ClassPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "My PageView Page",
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.black,
      child: _buildSlideShow(),
    );
  }

  Widget _buildSlideShow() {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _buildItem(movieList[index]);
        },
      ),
    );
  }

  Widget _buildItem(MovieModel item) {
    return Container(
      child: Image.network(
        item.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
