import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/screens/selfSession/ImageGallery.dart';
import 'package:healing_app/widget/Gtext.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
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
            padding: EdgeInsets.all(5),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Card(
                      child: Center(
                        child: Gtext(
                            text:
                                "Please close your eyes and take 7 slow deep breaths",
                            size: 30,
                            textAlign: TextAlign.center,
                            color: ApplicationConstants.defaultColor),
                      ),
                    )),
                Expanded(
                    flex: 6,
                    child: Card(
                      child: Center(
                        child: Gtext(
                            text:
                                "With your eyes closed, please request your Ancestors to bless you, guide you and protect you in this healing session – please keep your eyes closed for 2 mins and be with your ancestors. Please take their blessings",
                            size: 25,
                            textAlign: TextAlign.center,
                            color: ApplicationConstants.defaultColor),
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageGallery()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ApplicationConstants.defaultColor,
                    ),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gtext(
                          text: "Continue",
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
