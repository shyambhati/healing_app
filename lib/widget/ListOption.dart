import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/widget/SubMenu.dart';
import 'package:healing_app/widget/TimeLineView.dart';

class ListOption extends StatefulWidget {
  ListOption({Key? key, required this.title, required this.list})
      : super(key: key);

  var list = [];
  String title;

  @override
  _ListOptionState createState() => _ListOptionState();
}

class _ListOptionState extends State<ListOption> {
  bool dec = false;
  double hig = 0.0;

  void calculate() {
    if (widget.list.length != 0) {
      hig = widget.list.length * 55;
    }
  }

  void initState() {
    super.initState();
    calculate();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)],
          color: dec ? Colors.white38 : Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ExpansionTile(
          onExpansionChanged: (val) {
            setState(() {
              dec = !dec;
            });
          },
          tilePadding: EdgeInsets.only(left: 10.0, right: 10.0),
          leading: Icon(
            Icons.add,
            color: ApplicationConstants.defaultColor,
          ),
          trailing: Icon(
            !dec ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
            color: ApplicationConstants.defaultColor,
          ),
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 17, color: ApplicationConstants.defaultColor),
          ),
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 5, top: 10),
              height: hig,
              child: ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => SubMenu()));
                      },
                      child: TimeLineView(
                        Heading: widget.list[index],
                        Info: '',
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
