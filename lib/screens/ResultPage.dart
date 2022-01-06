import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/screens/Dashboard.dart';
import 'package:healing_app/screens/selfSession/ImageGallery.dart';
import 'package:healing_app/screens/selfSession/Step1.dart';
import 'package:healing_app/widget/Gtext.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Result "),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        child: Container(
                            height: 200,
                            padding: EdgeInsets.all(15),
                            child: Center(
                              child: Gtext(
                                text:
                                    "Based on your answers you need to take 2 sessions",
                                textAlign: TextAlign.center,
                                size: 25,
                                color: ApplicationConstants.defaultColor,
                              ),
                            ))),
                  ],
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Step1()));
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
                      text: "Start Self Process",
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
    );
  }
}
