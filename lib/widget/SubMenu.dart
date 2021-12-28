import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/screens/QuestionAnswer.dart';
import 'package:healing_app/widget/Gtext.dart';
import 'package:healing_app/widget/SubMenuList.dart';

class SubMenu extends StatefulWidget {
  const SubMenu({Key? key}) : super(key: key);

  @override
  _SubMenuState createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Relationship"),
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            // Container(
            //   child: Gtext(
            //     text: "Relationship",
            //     size: 30,
            //     textAlign: TextAlign.center,
            //   ),
            //   margin: EdgeInsets.only(bottom: 20, top: 10),
            // ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: SubMenuList(
                  text: "Couple Relationship",
                  size: 25,
                  color: ApplicationConstants.defaultColor
                  //image: "assets/r1.png"
                  ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuestionAnswer()));
              },
            ),
            SubMenuList(
              text: "Parent Relationship",
              size: 25,
              color: ApplicationConstants.defaultColor,
            ),
            SubMenuList(
              text: "Children Relationship",
              size: 25,
              color: ApplicationConstants.defaultColor,
            ),
            SubMenuList(
              text: "Biz Relationship",
              size: 25,
              color: ApplicationConstants.defaultColor,
            ),
          ],
        ),
      ),
    );
  }
}
