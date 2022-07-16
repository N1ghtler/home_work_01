import 'package:flutter/material.dart';

import '../database/movie_list_constant.dart';
import '../model/movie_model.dart';
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
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
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

  List<Widget> scrollbleBlock(List<MovieModel> movieList) {
    return movieList.map((movie) {
      String moviepic = movie.image;
      String moviename = movie.title;
      return Card(
          color: Colors.grey[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
