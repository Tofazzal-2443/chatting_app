import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        padding: const EdgeInsets.only(bottom: 10,),
        child: FloatingActionButton(
          onPressed: () async{
            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),
    );
  }
}
