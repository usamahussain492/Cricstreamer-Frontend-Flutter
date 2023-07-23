import 'package:cricstreamer/constants/text_styles.dart';
import 'package:cricstreamer/widgets/button.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';


class ShowDialog  {

  static dynamic show(BuildContext context,bool dialogType,String title,String message){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.415;
    return showDialog(context: context, builder: (BuildContext context){
        return Dialog(
          surfaceTintColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          child: Container(
            height: height,
            width: width,
            // margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: dialogType?[
                    Image.asset("assests/images/success_background.png",width: width,fit: BoxFit.fill,),
                    Image.asset("assests/images/success_logo.png", width: 88,height: 88,)
                  ]:[
                    Image.asset("assests/images/error_background.png",width: width,fit: BoxFit.fill,),
                    Image.asset("assests/images/error_logo.png", width: 88,height: 88,)
                  ],
                ),
                SizedBox(height: 30,),
                Text(title,style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff4E5D6A),
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 8,),
                Text(message!,style: gray_dark_style2,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 88),
                  child: Button(title: "Okay", func: (){
                    Navigator.of(context).pop();
                  },
                    colors: dialogType?[
                      green_dark,
                      green_light,
                    ]:[
                      Color(0xffF86B6B),
                      Color(0xffFE9E6C)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        );
    });
  }

}
