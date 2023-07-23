import 'dart:async';

import 'package:cricstreamer/constants/colors.dart';
import 'package:cricstreamer/res/routes/route_name.dart';
import 'package:cricstreamer/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      ()async {
        final SharedPreferences sp = await SharedPreferences.getInstance();
        final String? token = sp.getString('token');
        if(token!=null){
          Navigator.pushNamedAndRemoveUntil(context, RouteName.home,(route) => false);
        }
        else
          Navigator.pushNamedAndRemoveUntil(context, RouteName.login, (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: <Color>[green_light, green_dark],
              ),
            ),
          ),
         const Text(
            "CRIC \nSTREAMER",
            style: green_style2,
          ),
        ],
      ),
    );
  }
}
