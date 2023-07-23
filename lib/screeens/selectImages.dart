import 'dart:io';

import 'package:cricstreamer/constants/colors.dart';
import 'package:cricstreamer/screeens/add_post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/text_styles.dart';

class SelectImages extends StatefulWidget {
  const SelectImages({Key? key}) : super(key: key);

  @override
  State<SelectImages> createState() => _SelectImagesState();
}

class _SelectImagesState extends State<SelectImages> {
  final ImagePicker _picker = ImagePicker();
  late List<XFile> images;
  late XFile photo;
  List<Map> allImages = [];
  bool selectAll = false;

  void getImages() async {
    images = await _picker.pickMultiImage();
    setState(() {
      for (int i = 0; i < images.length; i++) {
        allImages.add({'path': images[i].path, 'isSelected': false});
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          title: Text("Select Image", style: green_style3),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                List<Map> selectedImages = [];
                for (int i = 0; i < allImages.length; i++) {
                  if (allImages[i]["isSelected"] == true)
                    selectedImages.add(allImages[i]);
                }
                print(selectedImages.length);
                if (selectedImages.length > 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddPost(allImages: selectedImages)));
                } else {
                  Fluttertoast.showToast(
                    msg: "please select atleast one image.",
                    backgroundColor: gray_dark,
                  );
                }
              },
              child: Icon(
                Icons.arrow_forward,
                color: green_light,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    itemCount: allImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.grey,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  allImages[index]['isSelected'] =
                                      !allImages[index]['isSelected'];
                                });
                              },
                              child: Image.file(
                                File(allImages[index]['path']),
                                fit: BoxFit.cover,
                                width: 125,
                                height: 125,
                              ),
                            ),
                            Transform.scale(
                              scale: 0.8,
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: Checkbox(
                                  value: allImages[index]['isSelected'],
                                  onChanged: (a) {
                                    setState(() {
                                      allImages[index]['isSelected'] =
                                          !allImages[index]['isSelected'];
                                    });
                                  },
                                  focusColor: green_light,
                                  activeColor: green_dark,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) =>
                                        BorderSide(width: 1.0, color: gray),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.white,
              padding: EdgeInsets.only(left: 18, right: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      getImages();
                    },
                    child: Text(
                      "Gallery",
                      style: gray_style2,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(27.0, 0.0),
                    child: GestureDetector(
                      onTap: () async {
                        photo = (await _picker.pickImage(
                            source: ImageSource.camera))!;
                        setState(() {
                          allImages
                              .add({'path': photo.path, 'isSelected': false});
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: green_light,
                            borderRadius: BorderRadius.circular(30)),
                        child: Image.asset(
                          "assests/images/camera.png",
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "Select All",
                          style: gray_style2,
                        ),
                        Checkbox(
                          activeColor: green_dark,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(width: 1.0, color: gray),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          value: selectAll,
                          onChanged: (a) {
                            setState(() {
                              selectAll = !selectAll;
                              for (int i = 0; i < allImages.length; i++) {
                                allImages[i]['isSelected'] = selectAll;
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
