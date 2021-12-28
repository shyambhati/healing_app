import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/widget/Timeline.dart';

class TimeLineView extends StatefulWidget {
  TimeLineView(
      {Key? key,
      required this.Heading,
      required this.Info,
      this.DiscColor = Colors.blue,
      this.StripColor = Colors.blue})
      : super(key: key);
  String Heading;
  String Info;
  Color DiscColor;
  Color StripColor;

  @override
  _TimeLineViewState createState() => _TimeLineViewState();
}

class _TimeLineViewState extends State<TimeLineView> {
  bool dec = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                timelineDemo(
                  dicsColor: ApplicationConstants.defaultColor,
                  stripColor: ApplicationConstants.defaultColor,
                ),
                Container(
                  width: 200.0,
                  height: 35.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 1.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.Heading,
                          style: TextStyle(
                              fontSize: 17,
                              color: ApplicationConstants.defaultColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
