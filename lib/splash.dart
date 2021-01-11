import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/login_d/pages/splash_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text.rich(TextSpan(children: [
        TextSpan(
            text: 'H',
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        // color: Color.fromRGBO(220, 33, 76, 1))),
        // TextSpan(
        //     text: 'A',
        //     style: TextStyle(
        //         fontSize: 56,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.white)),
        // // color: Color.fromRGBO(220, 33, 76, 1))),
        // TextSpan(
        //     text: 'P',
        //     style: TextStyle(
        //         fontSize: 52,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.white)),
        // // color: Color.fromRGBO(220, 33, 76, 1))),
        // TextSpan(
        //     text: 'P',
        //     style: TextStyle(
        //         fontSize: 48,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.white)),
        // color: Color.fromRGBO(220, 33, 76, 1))),
        TextSpan(
            text: 'APPY',
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        // color: Color.fromRGBO(220, 33, 76, 1))),
        TextSpan(
            text: 'W',
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        // color: Color.fromRGBO(220, 33, 76, 1))),
        TextSpan(
            text: 'ASH',
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                // color: Color.fromRGBO(220, 33, 76, 1)
                color: Colors.white)),
        // TextSpan(
        //     text: 'S',
        //     style: TextStyle(
        //         fontSize: 56,
        //         fontWeight: FontWeight.bold,
        //         // color: Color.fromRGBO(220, 33, 76, 1),
        //         color: Colors.white)),
        // TextSpan(
        //     text: 'H',
        //     style: TextStyle(
        //         fontSize: 60,
        //         fontWeight: FontWeight.bold,
        //         // color: Color.fromRGBO(220, 33, 76, 1)
        //         color: Colors.white)),
      ])),
      nextScreen: SplashPage(),
      duration: 100,
      backgroundColor: Color.fromRGBO(0, 127, 219, 1),
      animationDuration: Duration(seconds: 3),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
