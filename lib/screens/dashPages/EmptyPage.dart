import 'package:flutter/material.dart';
import 'package:healing_app/widget/Gtext.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Gtext(
          text: "Empty page",
        ),
      ),
    );
  }
}
