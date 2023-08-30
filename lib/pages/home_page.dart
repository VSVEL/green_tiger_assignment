import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switter/pages/post_page.dart';

import '../api/apicalls.dart';
import '../components/user_card.dart';
import '../helpers/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getUsers();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green Tiger'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getUsers(),
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
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
                                builder: (context) => UserPost(
                                  userId: index + 1,
                                ),
                              ),
                            ),
                        child: UserCard(
                          userName: snapshot.data![index].name.toString(),
                          userImage: 'https://picsum.photos/id/' +
                              Random().nextInt(100).toString() +
                              '/286/180',
                          userDescription:
                              snapshot.data![index].username.toString(),
                        ));
                  });
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
