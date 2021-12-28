import 'package:flutter/material.dart';
import 'package:healing_app/widget/Gtext.dart';

class SubMenuList extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final String image;

  SubMenuList(
      {required this.text,
      this.size = 16,
      this.color = Colors.black87,
      this.image = "assets/r1.png"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Gtext(
                text: text,
                size: size,
                color: color,
              ),
            ),
            //Image.asset('$image', width: 80, height: double.infinity)
          ],
        ),
      ),
    );
  }
}
