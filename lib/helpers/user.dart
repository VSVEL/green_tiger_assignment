class User {
  String? name;
  String? username;
  String? email;

  User({this.name, this.email, this.username});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}
