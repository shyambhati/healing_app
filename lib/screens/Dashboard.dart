import 'package:flutter/material.dart';
import 'package:healing_app/screens/dashPages/EmptyPage.dart';
import 'package:healing_app/screens/dashPages/Home.dart';
import 'package:healing_app/widget/Gtext.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _pageData = [
    EmptyPage(),
    EmptyPage(),
    Home(),
    EmptyPage(),
    EmptyPage(),
  ];
  int selectedItem = 2;

  bool? dec = true;
  bool showIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // toolbarHeight: 100.0,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        title: Gtext(
          text: "Healing App",
          color: Colors.white,
          size: 25,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 33,
              ))
        ],
      ),
      drawer: Container(
        width: 280,
        child: Drawer(
            elevation: 10.0,
            child: ListView(shrinkWrap: true, children: [
              Container(
                height: 120,
                child: DrawerHeader(
                  decoration: new BoxDecoration(
                    // gradient: new LinearGradient(
                    //     begin: Alignment.centerLeft,
                    //     end: Alignment.centerRight,
                    //     colors: [
                    //       Color(0xff908a93),
                    //       Color(0xffe80566),
                    //     ]),
                    color: Colors.red,
                  ),
                  padding: new EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 35.0,
                              backgroundColor: Colors.white24,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://tanaavmuktbharat.com/img/logo-tmb.png'),
                                radius: 30.0,
                                backgroundColor: Colors.white10,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Gtext(
                                  text: "name",
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(height: 10.0),
                                Gtext(
                                  text: "demo@gmail.com",
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: "TODAY"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: "PROGRAM"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: "INVITE"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "USER",
          ),
        ],
        currentIndex: selectedItem,
        onTap: (val) {
          setState(() {
            selectedItem = val;
          });
        },
      ),
      body: Container(
        child: SafeArea(child: _pageData[selectedItem]),
      ),
    );
  }
}
