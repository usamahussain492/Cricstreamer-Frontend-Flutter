import 'dart:ffi';
import 'dart:io';

import 'package:cricstreamer/screeens/home.dart';
import 'package:cricstreamer/widgets/image_carousel.dart';
import 'package:cricstreamer/widgets/profileImage.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/button.dart';

class AddPost extends StatefulWidget {
  List<Map> allImages = [];
  AddPost({Key? key, required this.allImages}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController caption = TextEditingController();
  List<Map> _allImages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allImages = widget.allImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: green_light,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text("Add Post", style: green_style3),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileImage("https://miro.medium.com/max/1000/1*5KZbCz9DNXFa2EDHou8C8A.png", 50, 50),
                  SizedBox(width: 8,),
                  Text("Zeeshan Ahmad",style: gray_dark_style5,)
                ],
              ),
              SizedBox(height: 18,),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
               controller: caption,
                decoration: InputDecoration(
                  fillColor: white_light,
                  label: Text(
                    "Caption",
                    style: TextStyle(
                      color: gray,
                    ),
                  ),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 18,),
              ImageCarousel(allImages: _allImages),
              SizedBox(height: 18,),
              Button(
                func: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(currentPage: 0,)));
                },
                title: "Upload",
                colors: [
                  green_dark,
                  green_light,
                ],
                icon: "assests/images/arrow.png",
                iconWidth: 13,
                iconHeight: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
