import 'package:cricstreamer/models/user_model.dart';
import 'package:cricstreamer/res/routes/route_name.dart';
import 'package:cricstreamer/res/routes/routes.dart';
import 'package:cricstreamer/screeens/create_team.dart';
import 'package:cricstreamer/screeens/home.dart';
import 'package:cricstreamer/screeens/selectImages.dart';
import 'package:cricstreamer/screeens/signUp.dart';
import 'package:cricstreamer/screeens/splash.dart';
import 'package:cricstreamer/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=> UserViewModel()),
      ],
      child: const MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
