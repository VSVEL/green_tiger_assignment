import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switter/components/post_card.dart';
import 'package:switter/helpers/comment.dart';

import '../api/apicalls.dart';

class UserComments extends StatefulWidget {
  final String? title;

  final String? body;

  final int? postId;

  const UserComments({Key? key,this.title,this.body,this.postId}) : super(key: key);

  @override
  State<UserComments> createState() => _UserCommentsState();
}

class _UserCommentsState extends State<UserComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PostCard(
                title: widget.title,
                body: widget.body,
                is_comment: false,),
            ),
            Text('COMMENTS', style: TextStyle(fontSize: 24),),
            Expanded(
              child: Center(
                child: FutureBuilder(
                  future: getComments(widget.postId),
                  builder: (context, AsyncSnapshot<List<Comment>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data == null) {
                        return const Center(child: Text('Something went wrong'));
                      }
                      return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return PostCard(
                                title: snapshot.data![index].name.toString(),
                                body: snapshot.data![index].body.toString(),
                                is_comment: false,
                              );
                          });
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
