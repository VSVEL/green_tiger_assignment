import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final title;

  final body;

  final bool is_comment;

  const PostCard({Key? key, this.title, this.body, required this.is_comment})
      : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 24),
            ),
            Text(widget.body, style: TextStyle(fontSize: 16)),
            if (widget.is_comment == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Comments')),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
