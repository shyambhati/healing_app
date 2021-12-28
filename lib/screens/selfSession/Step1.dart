import 'package:flutter/material.dart';
import 'package:healing_app/widget/Gtext.dart';

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Gtext(text: "text"),
      )),
    );
  }
}
