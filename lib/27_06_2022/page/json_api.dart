import 'package:flutter/material.dart';
import 'package:home_work_01/27_06_2022/database/post_database.dart';

import '../model/post_model.dart';

class JsonApiPage extends StatefulWidget {
  const JsonApiPage({Key? key}) : super(key: key);

  @override
  State<JsonApiPage> createState() => _JsonApiPageState();
}

class _JsonApiPageState extends State<JsonApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bulidAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _bulidAppBar() {
    return AppBar(
      backgroundColor: Colors.amber[800],
      title: const Text("Json Api Page"),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildFutureBuilder(),
    );
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder<List<PostModel>>(
      future: PostData.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return _buildDisplay(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildDisplay(List<PostModel>? items) {
    if (items == null) {
      return const Icon(Icons.error);
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(PostModel item) {
    return Card(
        child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
            item.url,
            width: 100,
            height: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                width: 250,
                child: Text(
                  item.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 250,
                child: Text(
                  "User ID: ${item.id}",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 250,
                child: Text(
                  "Album ID: ${item.albumId}",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
