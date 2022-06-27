import 'dart:convert';

class PostModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PostModel(
      {this.albumId = 0,
      this.id = 0,
      this.title = "NO title",
      this.url = "NO url",
      this.thumbnailUrl = "No thumbnailUrl"});

  factory PostModel.fromMap(Map<String, dynamic> map) => PostModel(
        albumId: map['albumId'],
        id: map['id'],
        title: map['title'],
        url: map['url'],
        thumbnailUrl: map['thumbnailUrl'],
      );
}

List<PostModel> getPostModelList(String JsonData) {
  List list = json.decode(JsonData);

  return list.map((e) => PostModel.fromMap(e)).toList();
}
