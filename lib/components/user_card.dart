import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String  userImage;

  final String  userName;

  final  userDescription;

  const UserCard({Key? key,required this.userImage,required this.userName,this.userDescription}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

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
            Center(child: Image.network(widget.userImage)),
            Text(widget.userName, style: TextStyle(fontSize: 24),),
            Text(widget.userDescription,style: TextStyle(fontSize: 16)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Posts')),
                  ElevatedButton(onPressed: () {}, child: Text('To-dos')),
                  ElevatedButton(onPressed: () {}, child: Text('Albums')),
                ],
              ),
            ),

          ],
        ),
      ),
    ) ;
  }
}
