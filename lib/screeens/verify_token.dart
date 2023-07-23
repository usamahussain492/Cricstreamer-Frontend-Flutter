import 'dart:async';
import 'dart:convert';

import 'package:cricstreamer/data/response/status.dart';
import 'package:cricstreamer/res/routes/route_name.dart';
import 'package:cricstreamer/screeens/change_password.dart';
import 'package:cricstreamer/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../constants/box_decoration.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/button.dart';
import '../widgets/circle_logo.dart';
import '../widgets/size_box.dart';
import '../widgets/text_input.dart';
import 'package:percent_indicator/percent_indicator.dart';

class VerifyToken extends StatefulWidget {
  const VerifyToken({Key? key}) : super(key: key);

  @override
  State<VerifyToken> createState() => _VerifyTokenState();
}

class _VerifyTokenState extends State<VerifyToken> {
  final TextEditingController otp = TextEditingController();
  bool isCompleted = false;
  double percent = 0.0;
  int time = 1;
  late Timer timer;

  @override
  void initState() {
    // Timer timer;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        percent += 1.66666667;
        time += 1;
        if (time >= 60) {
          isCompleted = true;
          timer.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userViewMode = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: white_light,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 30),
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height / 7.7),
                width: MediaQuery.of(context).size.width,
                decoration: boxDecoration1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Verify Your Identity",
                      style: green_style1,
                    ),
                    SizeBox(
                      height: 48,
                    ),
                    // ignore: unnecessary_new
                    new CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 8.0,
                      percent: ((percent.round()) / 100).toDouble(),
                      center: new Text(
                        time.toString() + " sec",
                        style: gray_style2,
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: green_light,
                    ),
                    SizeBox(
                      height: 38,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter the code that you recieved on your email.",
                        style: gray_style3,
                      ),
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    TextInput(
                      textlabel: "OTP Code",
                      iconlabel: "assests/images/password.png",
                      controller: otp,
                      keyboardType: true,
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    if (isCompleted)
                      Container(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, RouteName.reset_password,(route) => false);
                          },
                          child: Text(
                            "Dont't recieve code?",
                            style: gray_style3,
                          ),
                        ),
                      ),
                    SizeBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                    ),
                    Button(
                        title: "Submit",
                        isLoading: userViewMode.verifyOtpResponse.status ==
                                Status.LOADING
                            ? true
                            : false,
                        func: () {
                          if(userViewMode.resetPassword.status == Status.COMPLETED){
                            userViewMode.verifyOtpApi(jsonEncode({
                              "userId": userViewMode.resetPassword.data['data']['_id'].toString(),
                              "otp": otp.text.trim().toString()
                            }), context);
                          }
                        }),
                  ],
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height / 7.7),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, RouteName.login,(route) => false);
                        },
                        child: Text("Sign in with different account.",
                            style: gray_style2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
