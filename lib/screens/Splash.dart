import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:healing_app/screens/Intro.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Timer(
          Duration(seconds: 5),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Intro())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: Image.asset("assets/aa.png"),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            child: Image.asset(
              "assets/timthumb.png",
              width: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}
