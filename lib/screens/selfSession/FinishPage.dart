import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/screens/Dashboard.dart';
import 'package:healing_app/screens/selfSession/ImageGallery.dart';
import 'package:healing_app/screens/selfSession/Step1.dart';
import 'package:healing_app/widget/Gtext.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
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
                                text: "Thanks",
                                textAlign: TextAlign.center,
                                size: 25,
                                color: ApplicationConstants.defaultColor,
                              ),
                            ))),
                  ],
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
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
                      text: "Home Page",
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
