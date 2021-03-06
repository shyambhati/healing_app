import 'package:flutter/material.dart';
import 'package:healing_app/widget/Gtext.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:reorderables/reorderables.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  File? image1, _image2, _image3, _image4, _image5, _image6, _image7;
  var elevation = 3.0;
  late String name1, name2;

  // List<Widget> _tiles;

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

  imageDesign(File? img, int index) {
    return Container(
      width: 110,
      height: 110,
      child: Card(
          elevation: elevation,
          child: Container(
            padding: EdgeInsets.all(5),
            child: img != null
                ? GestureDetector(
                    onTap: () {
                      openBottomSheet(index);
                    },
                    child: Container(
                      child: Image.file(
                        img,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
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
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double sW(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  Offset p1 = Offset(0, 0);
  Offset p2 = Offset(110, 0);
  Offset p3 = Offset(220, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Arange Image "),
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
        ),
        body: Stack(
          children: [
            Positioned(
              left: p1.dx,
              top: p1.dy,
              child: Draggable(
                feedback: imageDesign(image1, 1),
                childWhenDragging: Opacity(
                  opacity: .3,
                  child: imageDesign(image1, 1),
                ),
                onDragEnd: (details) =>
                    {setState(() => p1 = details.offset), print(details)},
                child: imageDesign(image1, 1),
              ),
            ),
            Positioned(
              left: p2.dx,
              top: p2.dy,
              child: Draggable(
                feedback: imageDesign(image1, 1),
                childWhenDragging: Opacity(
                  opacity: .3,
                  child: imageDesign(image1, 1),
                ),
                onDragEnd: (details) =>
                    {setState(() => p2 = details.offset), print(details)},
                child: imageDesign(_image2, 1),
              ),
            ),
            Positioned(
              left: p3.dx,
              top: p3.dy,
              child: Draggable(
                feedback: imageDesign(image1, 1),
                childWhenDragging: Opacity(
                  opacity: .3,
                  child: imageDesign(image1, 1),
                ),
                onDragEnd: (details) => {
                  setState(() => p3 = details.offset),
                  print(details.offset)
                },
                child: imageDesign(_image3, 1),
              ),
            )
          ],
        )
        // body: Container(
        //   color: Colors.red,
        //   width: double.infinity,

        //   child: Column(
        //     children: [
        //       Draggable(
        //           child: imageDesign(image1, 1),
        //           feedback: imageDesign(image1, 1)),
        //     ],
        //   ),
        // ),

        // body: GridView.count(
        //   crossAxisCount: 3,
        //   crossAxisSpacing: 1.0,
        //   mainAxisSpacing: 1.0,
        //   children: [
        //     Draggable(
        //         child: imageDesign(image1, 1), feedback: imageDesign(image1, 1)),
        //     imageDesign(_image2, 2),
        //     imageDesign(_image3, 3),
        //     imageDesign(_image4, 4),
        //     imageDesign(_image5, 5),
        //     imageDesign(_image6, 6),
        //   ],
        // ),
        );
  }
}
