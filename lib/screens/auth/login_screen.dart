import 'dart:developer';
import 'dart:io';

import 'package:chatting_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../api/apis.dart';
import '../../helper/dialogs.dart';
import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Firebase Google email authentication code
  _handleGoogleBtnClick() {
    //for showing progress bar
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) {
      //for hiding progress bar
      Navigator.pop(context);
      if (user != null) {
        log("\nUser : ${user.user}");
        log("\nUserAdditionalInfo: ${user.additionalUserInfo}");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      //It will give error if there is no internet connection
      await InternetAddress.lookup("google.com");
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log("_signInWithGoogle: $e");
      Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet!)');
      return null;
    }
  }

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
}
