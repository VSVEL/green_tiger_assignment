import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switter/api/apicalls.dart';
import 'package:switter/pages/comment_page.dart';

import '../components/post_card.dart';
import '../helpers/post.dart';
import '../helpers/user.dart';

class UserPost extends StatefulWidget {
  final int userId;

  const UserPost({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green Tiger'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getPosts(widget.userId),
          builder: (context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return const Center(child: Text('Something went wrong'));
              }

              return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserComments(
                            title: snapshot.data![index].title.toString(),
                            body: snapshot.data![index].body.toString(),
                            postId: snapshot.data![index].id,
                          ),
                        ),
                      ),
                      child: PostCard(
                        title: snapshot.data![index].title.toString(),
                        body: snapshot.data![index].body.toString(),
                        is_comment: true,
                      ),
                    );
                  });
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
