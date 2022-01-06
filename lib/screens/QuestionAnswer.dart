import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/screens/ResultPage.dart';
import 'package:healing_app/widget/Gtext.dart';

class QuestionAnswer extends StatefulWidget {
  const QuestionAnswer({Key? key}) : super(key: key);

  @override
  _QuestionAnswerState createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  int _i = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _i = 0;
    });
  }

  var question = [
    "Was your or your spouse's parents relation with eeach other not good",
    "Wash your relation with any of your parent not good",
    "Was your spouse relation with any of their parent not good",
    "Was the relationship of your or spouse's grandparents not good",
    "Wheather you had any intimate relationship before or after the marriage",
    "Wheather your spouse had any intimate relationship before or after the marriage",
    "Wheather you or your spouse was separated from your mother or father during your childhood, even for a day, or you did your schooling in __",
    "If the answers to all these questions are No then please click here"
  ];
  void Result() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ResultPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Answer some questions "),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xff23293F),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                                    text: question[_i],
                                    textAlign: TextAlign.center,
                                    size: 25,
                                    color: ApplicationConstants.defaultColor,
                                  ),
                                ))),
                      ],
                    )),
                GestureDetector(
                  onTap: () {
                    if (_i < question.length && _i != question.length - 1) {
                      setState(() {
                        _i++;
                      });
                    } else {
                      Result();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 25),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Gtext(
                          text: "YES",
                          size: 25,
                        ),
                        Container(
                            height: double.infinity,
                            child: Icon(
                              Icons.check_circle,
                              size: 50,
                              color: ApplicationConstants.defaultColor,
                            ))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_i < question.length && _i != question.length - 1) {
                      setState(() {
                        _i++;
                      });
                    } else {
                      Result();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 25),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        // color: ApplicationConstants.defaultColor,
                        color: Colors.white),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Gtext(
                          text: "NO",
                          size: 25,
                        ),
                        Container(
                            height: double.infinity,
                            child: Icon(
                              Icons.cancel,
                              size: 50,
                              color: ApplicationConstants.defaultColor,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
