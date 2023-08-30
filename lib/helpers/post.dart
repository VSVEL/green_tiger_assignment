class Post {
  String? title;
  String? body;
  int? id;
  

  Post({this.title, this.body,});

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['id'] = id;
    return data;
  }
}