import 'package:cricstreamer/res/routes/route_name.dart';
import 'package:cricstreamer/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import 'drawer_list_tile.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewMode = Provider.of<UserViewModel>(context);
    return Drawer(
      backgroundColor: white,
      width: MediaQuery.of(context).size.width * 0.8,
      elevation: 0,
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border:
                    Border(bottom: BorderSide(color: gray, width: 1))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: gray_dark, width: 1),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: green_dark,
                        radius: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Cricstreamer",
                              style: gray_dark_style1
                          ),
                          Text(
                              "cricstreamer123@gmail.com",
                              style: gray_dark_style2
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      left: 30, top: 10, right: 20, bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            DrawerListTile(image: "assests/images/user-plus.png", textStyle: gray_dark_style3, title: 'Add Account',),
                            DrawerListTile(image: "assests/images/settings.png", textStyle: gray_dark_style3, title: 'Settings',),
                            GestureDetector(onTap:()async{
                              if(await userViewMode.remove()){
                                Navigator.pushNamedAndRemoveUntil(context, RouteName.login,(route) => false);
                              }},child: DrawerListTile(image: "assests/images/log-out.png", textStyle: gray_dark_style3, title: 'Logout',)),
                          ],
                        ),
                      ),
                      Container(
                        child: Text("CRIC STREAMER",style: gray_style11),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
