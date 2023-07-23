import 'dart:io';

import 'package:cricstreamer/constants/colors.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  List<Map> allImages;
  ImageCarousel({Key? key, required this.allImages}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late List<Map> _allImages;
  int currentIndex = 0;
  int dotIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allImages = widget.allImages;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.412,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 3),
                blurRadius: 9)
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(_allImages[currentIndex]["path"]),
              fit: BoxFit.fill,
            ),
          ),
        ),
        if (_allImages.length > 1)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if(currentIndex>0){
                          currentIndex = currentIndex-1;
                        }
                        else{
                          currentIndex = _allImages.length-1;
                        }
                        if(dotIndex == 0){
                          dotIndex = 2;
                        }
                        else{
                          dotIndex-=1;
                        }
                      });
                    },
                    child: Icon(
                      Icons.arrow_circle_left_rounded,
                      color: Colors.white,
                    )),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(currentIndex==_allImages.length-1){
                        currentIndex = 0;
                      }
                      else{
                        currentIndex += 1;
                      }
                      if(dotIndex == 2){
                        dotIndex = 0;
                      }
                      else{
                        dotIndex+=1;
                      }
                    });
                  },
                  child: Icon(
                    Icons.arrow_circle_right_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height * 0.37,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assests/images/dot-fill.png",
                color: dotIndex == 0 ? green_light : white,
                width: dotIndex == 0 ? 10 : 6,
                height: dotIndex == 0 ? 10 : 6,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assests/images/dot-fill.png",
                color: dotIndex == 1 ? green_light : white,
                width: dotIndex == 1 ? 10 : 6,
                height: dotIndex == 1 ? 10 : 6,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assests/images/dot-fill.png",
                color: dotIndex == 2 ? green_light : white,
                width: dotIndex == 2 ? 10 : 6,
                height: dotIndex == 2 ? 10 : 6,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
