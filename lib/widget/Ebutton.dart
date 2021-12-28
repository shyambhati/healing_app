import 'package:flutter/material.dart';

class Ebutton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onClick;
  final bool isRounded;

  const Ebutton({
    required this.text,
    this.color = Colors.blueAccent,
    this.onClick,
    this.isRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick!.call();
      },
      child: Text(
        text,
      ),
      style: ElevatedButton.styleFrom(
          primary: color, //
          shape: isRounded ? StadiumBorder() : null),
    );
  }
}