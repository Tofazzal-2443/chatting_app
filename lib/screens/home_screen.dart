import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../api/apis.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        title: const Text("We Chat"),
        actions: [
          //search user button
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),

          //More features button
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      //Floating button to add new user
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: FloatingActionButton(
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),
      //home page bode design
      body: StreamBuilder(
        stream: APIs.firestore.collection('user').snapshots(),
        builder: (context, snapshot) {
          
          final list = [];
          if (snapshot.hasData){
            final data = snapshot.data?.docs;
            for (var i in data!){
              log('Data: ${i.data()}');
              list.add(i.data()['name']);
            }

          }
          return ListView.builder(
            itemCount: list.length,
            padding: EdgeInsets.only(top: mq.height * .01),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Text('Name: ${list[index]}');

            },
          );
        },
      ),
    );
  }
}
