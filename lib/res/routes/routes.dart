

import 'package:cricstreamer/res/routes/route_name.dart';
import 'package:cricstreamer/screeens/change_password.dart';
import 'package:cricstreamer/screeens/home.dart';
import 'package:cricstreamer/screeens/login.dart';
import 'package:cricstreamer/screeens/reset_password.dart';
import 'package:cricstreamer/screeens/signUp.dart';
import 'package:cricstreamer/screeens/splash.dart';
import 'package:cricstreamer/screeens/verify_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {


  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=> const SplashScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> const Login());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> const SignUp());
      case RouteName.reset_password:
        return MaterialPageRoute(builder: (BuildContext context)=> const ResetPassword());
      case RouteName.verify_password:
        return MaterialPageRoute(builder: (BuildContext context)=> const VerifyToken());
      case RouteName.change_password:
        return MaterialPageRoute(builder: (BuildContext context)=> const ChangePassword());
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> Home(currentPage: 2,));
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}