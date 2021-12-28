import 'package:flutter/material.dart';

class timelineDemo extends StatelessWidget {
  timelineDemo({Key? key, required this.dicsColor, required this.stripColor})
      : super(key: key);

  final Color dicsColor;
  final Color stripColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
            width: 2.0,
            child: Container(
              color: stripColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1.0)],
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: CircleAvatar(
              radius: 6.0,
              backgroundColor: dicsColor,
            ),
          ),
          SizedBox(
            height: 25.0,
            width: 2.0,
            child: Container(
              color: stripColor,
            ),
          ),
        ],
      ),
    );
  }
}
