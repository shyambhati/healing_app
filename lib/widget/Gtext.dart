import 'package:flutter/material.dart';

class Gtext extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextAlign textAlign;

  const Gtext(
      {required this.text, this.size = 16, this.color = Colors.black87,this.textAlign=TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: size, color: color),
        textAlign: textAlign,
      ),
    );
  }
}
