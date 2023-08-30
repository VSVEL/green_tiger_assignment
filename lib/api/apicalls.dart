import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:switter/helpers/comment.dart';
import '../helpers/post.dart';
import '../helpers/user.dart';

Future<List<User>> getUsers() async {

  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));

  if (response.statusCode == 200) {
    final List result = json.decode(response.body);
    return result.map((e) => User.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load');
  }
}

Future<List<Post>> getPosts(userId) async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'+ userId.toString()+'/posts'));

  if (response.statusCode == 200) {
    final List result = json.decode(response.body);
    return result.map((e) => Post.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load');
  }
}

Future<List<Comment>> getComments(postId) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'+postId.toString()+'/comments'));


  if (response.statusCode == 200) {
    final List result = json.decode(response.body);
    return result.map((e) => Comment.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load');
  }
}