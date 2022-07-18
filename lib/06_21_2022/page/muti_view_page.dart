import 'package:flutter/material.dart';

import '../database/movie_list_constant.dart';
import '../model/movie_model.dart';
import 'helper/list_view_data_load.dart';
import 'profile_page.dart';

class MutiViewPage extends StatefulWidget {
  MutiViewPage({Key? key}) : super(key: key);

  @override
  State<MutiViewPage> createState() => _MutiViewPageState();
}

class _MutiViewPageState extends State<MutiViewPage> {
  List<MovieModel> movieListData = movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: _buildappbar(),
      body: _builtbodymutiviewpage(),
    );
  }

  AppBar _buildappbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: const Text(
        "Muti List Views",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfilePage();
            }));
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset("assets/image/9.jpeg")),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget _builtbodymutiviewpage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildscrollbleverview(movieListData),
            const SizedBox(
              height: 20,
            ),
            _buildscrollbleverviewwithtitle(movieListData),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, bottom: 10),
              child: Text(
                "Listview",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.pink,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildlistview(),
          ],
        ),
      ),
    );
  }

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
            "Top New Movies",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.pink,
            ),
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
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: listViewDataLoad(movieListData),
      ),
    );
  }
}
