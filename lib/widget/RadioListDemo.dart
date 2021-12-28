import 'package:flutter/material.dart';

class RadioListDemo extends StatefulWidget {
  const RadioListDemo({Key? key}) : super(key: key);

  @override
  _RadioListDemoState createState() => _RadioListDemoState();
}

enum person { vikas, akash, neeraj, suraj, chandan }

class _RadioListDemoState extends State<RadioListDemo> {
  person? val;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RadioListTile(
            title: Text("Vikas"),
            value: person.vikas,
            groupValue: val,
            onChanged: (person? value) {
              setState(() {
                val = value;
              });
            }),
        RadioListTile(
            title: Text("Akash"),
            value: person.akash,
            groupValue: val,
            onChanged: (person? value) {
              setState(() {
                val = value;
              });
            }),
        RadioListTile(
            title: Text("Neeraj"),
            value: person.neeraj,
            groupValue: val,
            onChanged: (person? value) {
              setState(() {
                val = value;
              });
            }),
        RadioListTile(
            title: Text("Suraj"),
            value: person.suraj,
            groupValue: val,
            onChanged: (person? value) {
              setState(() {
                val = value;
              });
            }),
        RadioListTile(
            title: Text("Chandan"),
            value: person.chandan,
            groupValue: val,
            onChanged: (person? value) {
              print(value);
              setState(() {
              val = value;
              });
            }),
      ],
    );
  }
}
