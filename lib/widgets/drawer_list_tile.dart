import 'package:flutter/material.dart';


class DrawerListTile extends StatelessWidget {
  String image;
  TextStyle textStyle;
  String title;
  DrawerListTile({Key? key,required this.title,required this.image, required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image,width: 25, height: 25,),
      title: Text(
          title,
          style: textStyle
      ),
    );
  }
}
