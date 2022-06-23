import 'package:flutter/material.dart';
import 'package:home_work_01/06_21_2022/page/profile_page.dart';

import '../database/movie_list_constant.dart';
import '../model/movie_model.dart';

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
      appBar: _buildappbar(),
      body: _builtbodymutiviewpage(),
    );
  }

  AppBar _buildappbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: Text(
        "Muti List Views",
        style: TextStyle(color: Colors.blue),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfilePage();
            }));
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/image/9.jpeg")),
        ),
        SizedBox(
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "ListView",
                style: TextStyle(fontSize: 20),
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
      bool isLike = false;
      String moviepic = movie.image;
      return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            onTap: () {
              setState(() {
                isLike = !isLike;
                print(isLike);
              });
            },
            child: Column(
              children: [
                Image.network(
                  moviepic,
                  width: 200,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: isLike ? Colors.red : Colors.black,
                  ),
                )
              ],
            ),
          ));
    }).toList();
  }

  List<Widget> listViewDataLoad(List<MovieModel> movieList) {
    return movieList.map((movie) {
      String moviepic = movie.image;
      bool isLike = false;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            Image.network(
              moviepic,
              width: 200,
              height: 200,
            ),
            Positioned(
                left: 200,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 160,
                      child: Text(
                        movie.des,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("More Info"),
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
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: listViewDataLoad(movieListData),
      ),
    );
  }
}
