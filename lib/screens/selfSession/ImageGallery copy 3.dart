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

  late List<ReorderableTableRow> _itemRows;

  imageDesign(File? img, int index) {
    return Expanded(
      child: Card(
          elevation: elevation,
          child: Container(
            height: 150,
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
                      color: Colors.grey,
                    ),
                  ),
          )),
    );
  }

  late List<Widget> _tiles;
  final double _iconSize = 90;

  @override
  void initState() {
    super.initState();
    var data = [
      [
        imageDesign(image1, 1),
        imageDesign(_image2, 2),
        imageDesign(_image3, 3)
      ],
      [
        imageDesign(_image4, 4),
        imageDesign(_image5, 5),
        imageDesign(_image6, 6)
      ]
    ];

    _itemRows = data.map((row) {
      return ReorderableTableRow(
        //a key must be specified for each row
        key: ObjectKey(row),
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[row[0], row[1], row[2]],
      );
    }).toList();

    _tiles = <Widget>[
      Expanded(
        child: imageDesign(image1, 1),
      ),
      imageDesign(image1, 1),
      imageDesign(_image2, 2),
      imageDesign(_image3, 3),
      imageDesign(_image4, 4),
      imageDesign(_image5, 5),
      imageDesign(_image6, 6),
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
        spacing: 8.0,
        runSpacing: 3.0,
        padding: const EdgeInsets.all(19),
        children: _tiles,
        onReorder: _onReorder,
        onNoReorder: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
        },
        onReorderStarted: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
        });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Arange Image "),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: ReorderableTable(
        children: _itemRows,
        onReorder: _onReorder,
      ),
      // body: Column(
      //   children: <Widget>[
      //     ReorderableWrap(
      //         maxMainAxisCount: 3,
      //         minMainAxisCount: 3,
      //         children: _tiles,
      //         onReorder: _onReorder,
      //         onNoReorder: (int index) {
      //           //this callback is optional
      //           debugPrint(
      //               '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      //         },
      //         onReorderStarted: (int index) {
      //           //this callback is optional
      //           debugPrint(
      //               '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
      //         })
      //   ],
      // ),
      // body: GridView.count(
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 1.0,
      //   mainAxisSpacing: 1.0,
      //   children: [
      //     imageDesign(image1, 1),
      //     imageDesign(_image2, 2),
      //     imageDesign(_image3, 3),
      //     imageDesign(_image4, 4),
      //     imageDesign(_image5, 5),
      //     imageDesign(_image6, 6),
      //     imageDesign(_image7, 7),
      //   ],
      // ),
    );
  }
}
