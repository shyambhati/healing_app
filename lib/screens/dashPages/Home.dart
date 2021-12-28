import 'package:flutter/material.dart';
import 'package:healing_app/widget/Gtext.dart';
import 'package:healing_app/widget/ListOption.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Gtext(text: "text"),
            SizedBox(
              height: 50.0,
            ),
            ListOption(
              title: 'Healing',
              list: [
                'Relationship',
                'Depression',
                'Anxiety',
                'Psychological Disorder',
                'Financial Abundance'
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            ListOption(
              title: 'Chronic Disease Support',
              list: ['item1'],
            ),
            SizedBox(
              height: 20.0,
            ),
            ListOption(
              title: 'Corporate Support',
              list: ['item1', 'item 2'],
            ),
            SizedBox(
              height: 20.0,
            ),
            ListOption(
              title: 'Healing Meditations',
              list: ['item1', 'item 2'],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
