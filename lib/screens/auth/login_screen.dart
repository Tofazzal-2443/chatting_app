import 'dart:math';

import 'package:chatting_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    //mq = MediaQuery.of(context).size;
    return Scaffold(
      //app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Welcome to We Chat"),
      ),
      //body
      body: Stack(
        children: [

          //App logo icon
          Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset(
              "images/icon.png",
            ),

          ),

          //google login button
          Positioned(
            //top: mq.height * .15,
            bottom: mq.height * .15,
            left: mq.width * .05,

            width: mq.width * .9,
            height: mq.width * .1,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                shape: StadiumBorder(),
                elevation: 4,
              ),
              onPressed: () {
                _handleGoogleBtnClick();
              },

              //Login Icon
              icon: Image.asset(
                "images/google.png",
                height: mq.height * .03,
              ),

              //Login with google label
              label: RichText(
                text: TextSpan(style: TextStyle(fontSize: 20), children: [
                  TextSpan(
                    text: "Login with ",
                  ),
                  TextSpan(
                    text: "Google",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Firebase Google email authentication code
  _handleGoogleBtnClick() {
    _signInWithGoogle().then((user) {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const HomeScreen()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}
