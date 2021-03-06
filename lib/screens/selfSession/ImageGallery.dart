import 'package:flutter/material.dart';
import 'package:healing_app/core/ApplicationConstants.dart';
import 'package:healing_app/screens/selfSession/FinishPage.dart';
import 'package:healing_app/widget/Gtext.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  File? image1, _image2, _image3, _image4, _image5, _image6, _image7;
  var elevation = 3.0;
  late String name1, name2;

  bool nowView = true;

  Future Imagechose(ImageSource Source, int index) async {
    final ima = await ImagePicker().pickImage(source: Source, imageQuality: 50);

    if (ima == null) return null;

    final image = File(ima.path);

    if (index == 1)
      setState(() {
        image1 = image;
      });
    else if (index == 2)
      setState(() {
        _image2 = image;
      });
    else if (index == 3)
      setState(() {
        _image3 = image;
      });
    else if (index == 4)
      setState(() {
        _image4 = image;
      });
    else if (index == 5)
      setState(() {
        _image5 = image;
      });
    else if (index == 6)
      setState(() {
        _image6 = image;
      });
    else if (index == 7)
      setState(() {
        _image7 = image;
      });
    Navigator.pop(context);
  }

  openBottomSheet(int index) {
    return showModalBottomSheet(
        backgroundColor: Colors.black38.withOpacity(0.0),
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            height: 160.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Gtext(
                    text: "Select Image",
                    size: 20,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  width: 80.0,
                  height: 2.0,
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Imagechose(ImageSource.gallery, index);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      child: Row(children: [
                        SizedBox(
                          width: 30.0,
                        ),
                        Icon(
                          Icons.image_outlined,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Gtext(
                          text: "Gallery",
                          size: 17,
                        ),
                      ]),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Imagechose(ImageSource.camera, index);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    child: Row(children: [
                      SizedBox(
                        width: 30.0,
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Gtext(
                        text: "Camera",
                        size: 17,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget imageDesign(int index) {
    File? img;
    if (index == 1)
      img = image1;
    else if (index == 2)
      img = _image2;
    else if (index == 3)
      img = _image3;
    else if (index == 4)
      img = _image4;
    else if (index == 5)
      img = _image5;
    else if (index == 6)
      img = _image6;
    else if (index == 7) img = _image7;
    print("Index is : " + index.toString());
    return index < 7
        ? Visibility(
            key: ValueKey(index),
            visible: vis[index] == 0 ? true : false,
            child: Card(
                elevation: elevation,
                child: Container(
                  child: img != null
                      ? Stack(
                          children: [
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  openBottomSheet(index);
                                },
                                child: Container(
                                  color: Colors.red,
                                  width: double.infinity,
                                  child: Image.file(
                                    img,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () {
                                  removeImage(index);
                                },
                                child: Container(
                                  color: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : IconButton(
                          onPressed: () {
                            openBottomSheet(index);
                          },
                          icon: Icon(
                            Icons.image_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                )),
          )
        : Container(key: ValueKey(index), child: SizedBox());
  }

  removeImage(int index) {
    setState(() {
      if (index == 1)
        image1 = null;
      else if (index == 2)
        _image2 = null;
      else if (index == 3)
        _image3 = null;
      else if (index == 4)
        _image4 = null;
      else if (index == 5)
        _image5 = null;
      else if (index == 6)
        _image6 = null;
      else if (index == 7) _image7 = null;
    });
  }

  final data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  final vis = [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1];
  int _task = 0;
  int _heading = 0;

  var task = [
    "Please put pictures of yourself, your spouse, your parents and parents of your spouse ",
    "Now first look at your spouse and say ???Please be here and help me in healing our relationship with each other, Thank you",
    "Now to your parents ??? ???I request you both to be present here and help me healing my relation with my spouse (name), Thank you",
    "Now to parents of your spouse ??? ???I request you both to be present here and help me healing my relation with my spouse (name), Thank you",
    "Now to yourself ??? ???Please be here to heal our relationship with spouse (name), Thank you",
    "Now arrange all of them as per your wish", // 1st end here
    "Put your image in-front of your spouse and look at her and say whatever you would like to tell her ??? any guilt, grudges, anger whatever is there in your mind, please tell her loudly",
    "Now put your spouse image in front of your image ??? and just imagine what would she reply on hearing what all you just said to her. Please say these to yourself from your spouse???s side",
    "Now put your image in-front of your parents and say whatever you would like to tell them",
    "Now put your image in-front of your in-laws and convey to them whatever you would like to tell them -  this is the time when you must release what has been bothering you for many years now. If you feel like crying, please go ahead, this is the right place for your to release your emotions",
    "Now turn to your spouse and say ??? Whatever guilt there may have been in our relationship, I choose to love you with all my heart. You are my wife and I am your husband. Thank you.",
    "Now please arrange your field in this way- put your parents pic in one line and at a little distance but in the same line plz put your parents in law picture together, below all of the facing them plz put your and your spouse image ",
    "Now look at your parents and say ??? you are my parents and I m your son. I honor and respect you as my parents. Thank you for giving me this life. ?????? 3 times",
    "Now please look at your parents in law and from your spouse side, please say ??? you are my parents and I m your daughter. . I honor and respect you as my parents. Thank you for giving me this life ?????? 3 times ",
    "Now just imagine that your parents and your parents in laws are blessing you and your spouse. Close your eyes and receive their blessings. It can come to you in any form like colors, flowers, energy ???",
    "Feel yourself standing and smiling with your family",
    "Now look towards your spouse and say ??? Thank you for coming and helping in this healing process. Now you can leave. Please remove her image",
    "To your parents ??? Thank you for coming and helping in healing my  relationship. Thank you. Please remove their picture",
    "To your parents in laws ??? Thank you for coming and helping in healing my  relationship. Thank you. Please remove their picture",
    "To yourself ??? Thank you for helping in healing. Please remove your picture",
    "Now please close your eyes, take 7 slow deep breaths",
    "With your eyes closed, say thank you to all my ancestors for blessing and guiding in this healing process",
  ];

  var heading = [
    "Create your healing energy field ", //1 to 6
    "Releasing conscious emotions", // 7 to 10
    "Healing ", // 11 to 16
    "It???s time to pay Gratitude to the Universe ", // 17 to 22
  ];
  nextTask() {
    // if (image1 == null ||
    //     _image2 == null ||
    //     _image3 == null ||
    //     _image4 == null ||
    //     _image5 == null ||
    //     _image6 == null) {
    //   _showMyDialog();
    // }
    if (image1 == null || _image2 == null) {
      _showMyDialog();
    } else if (_task < task.length && _task != task.length - 1) {
      setState(() {
        _task++;
      });
      if (_task > 6 && _task < 11) {
        setState(() {
          _heading = 1;
        });
      } else if (_task > 10 && _task < 17) {
        setState(() {
          _heading = 2;
        });
      } else if (_task > 16 && _task < 23) {
        setState(() {
          _heading = 3;
        });
      }
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => FinishPage()));
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warrning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Please Select Image First'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  changeViewStatus() {
    setState(() {
      if (nowView) {
        nowView = false;
        if (image1 == null) vis[1] = 1;
        if (_image2 == null) vis[2] = 1;
        if (_image3 == null) vis[3] = 1;
        if (_image4 == null) vis[4] = 1;
        if (_image5 == null) vis[5] = 1;
        if (_image6 == null) vis[6] = 1;
      } else {
        nowView = true;
        vis[1] = 0;
        vis[2] = 0;
        vis[3] = 0;
        vis[4] = 0;
        vis[5] = 0;
        vis[6] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Arange Image "),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Container(
      //       width: 60,
      //       height: 60,
      //       child: Icon(Icons.arrow_forward),
      //       decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: ApplicationConstants.defaultColor),
      //     ),
      //     onPressed: () {
      //       nextTask();
      //     }),

      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          child: FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => {changeViewStatus()},
            child: Icon(nowView ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        FloatingActionButton(
          heroTag: "btn2",
          onPressed: () => {nextTask()},
          child: Container(
            width: 60,
            height: 60,
            child: Icon(Icons.arrow_forward),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ApplicationConstants.defaultColor),
          ),
        ),
      ]),

      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: ReorderableGridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: this.data.map((e) => imageDesign(e)).toList(),
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  final element = data.removeAt(oldIndex);
                  data.insert(newIndex, element);
                });
              },
            ),
          ),
          Flexible(
              flex: 3,
              child: Container(
                height: double.infinity,
                child: Card(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gtext(
                          text: heading[_heading],
                          size: 20,
                          textAlign: TextAlign.center,
                          color: Colors.red,
                        ),
                        Divider(),
                        Center(
                          child: Gtext(
                              text: task[_task],
                              size: 18,
                              textAlign: TextAlign.center,
                              color: ApplicationConstants.defaultColor),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
