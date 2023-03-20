import 'package:flutter/material.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //media query global key link
    mq = MediaQuery.of(context).size;
    return Scaffold(
      //app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Welcome to We Chat"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .15,
            left: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset(
              "images/icon.png",
            ),
          ),
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
              onPressed: () {},
              icon: Image.asset(
                "images/google.png",
                height: mq.height * .03,
              ),
              label: RichText(
                text: TextSpan(style: TextStyle(fontSize: 20), children: [
                  TextSpan(
                    text: "Sign In with ",
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
