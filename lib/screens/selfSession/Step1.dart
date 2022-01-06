import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/screens/selfSession/Step2.dart';
import 'package:healing_app/widget/Gtext.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Healing App "),
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 120.0,
                        fontFamily: 'Canterbury',
                        color: ApplicationConstants.defaultColor),
                    child: Center(
                      child: AnimatedTextKit(
                          animatedTexts: [
                            ScaleAnimatedText('1'),
                            ScaleAnimatedText('2'),
                            ScaleAnimatedText('3'),
                            ScaleAnimatedText('4'),
                            ScaleAnimatedText('5'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                          onFinished: () {
                            print("Finish");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step2()));
                          },
                          isRepeatingAnimation: false),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Gtext(
                      text: "We are preparing your healing energy field",
                      size: 25,
                      textAlign: TextAlign.center,
                      color: ApplicationConstants.defaultColor,
                    ))
              ],
            ),
          ),
        ));
  }
}
