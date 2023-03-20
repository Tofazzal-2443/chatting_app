import 'package:flutter/material.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isAnimate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        _isAnimate = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    mq = MediaQuery.of(context).size;
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
          AnimatedPositioned(
            top: mq.height * .15,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            width: mq.width * .5,
            child: Image.asset(
              "images/icon.png",
            ),
            duration: Duration(seconds: 1),
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
              onPressed: () {},

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
