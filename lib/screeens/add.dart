import 'package:cricstreamer/screeens/create_team.dart';
import 'package:cricstreamer/screeens/selectImages.dart';
import 'package:cricstreamer/screeens/selectVideos.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/button.dart';
class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20,right: 20,top:8,),
        child: Column(
          children: [
            Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: gray,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            SizedBox(height: 32,),
            Button(
              func: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectImages()));
              },
              title: "Upload Image",
              colors: [
                green_dark,
                green_light,
              ],
              icon: "assests/images/upload-image.png",
            ),
            SizedBox(height: 18,),
            Button(
              func: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectVideos()));
              },
              title: "Upload Video",
              colors: [
                Color(0xffFF8748),
                Color(0xffFE9E6C)
              ],
              icon: "assests/images/upload-video.png",
              iconHeight: 20,
              iconWidth: 20,
            ),
            SizedBox(height: 18,),
            Button(
                func: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTeam()));
                },
                title: "Live Streaming",
                colors: [
                  Color(0xffFF4A4A),
                  Color(0xffF86B6B),
                ],
                icon: "assests/images/live-streaming.png",
                iconHeight: 18,
                iconWidth: 18
            ),

          ],
        ),
      );
  }
}
