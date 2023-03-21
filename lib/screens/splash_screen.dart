import 'package:chatting_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../main.dart';

//Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAnimate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const HomeScreen()));
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
          Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset(
              "images/icon.png",
            ),
          ),
          Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: Text(

              "MADE IN BANGLADESH ❤",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                letterSpacing: .5
              ),
            ),
          ),
        ],
      ),
    );
  }
}
