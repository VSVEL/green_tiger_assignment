class Comment {
  String? name;

  String? body;

  String? email;

  Comment({this.name, this.body, this.email});

  Comment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    body = json['body'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['body'] = body;
    data['email'] = email;
    return data;
  }
}
