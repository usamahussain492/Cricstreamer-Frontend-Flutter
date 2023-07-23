import 'dart:convert';

import 'package:cricstreamer/constants/box_decoration.dart';
import 'package:cricstreamer/data/response/status.dart';
import 'package:cricstreamer/res/routes/route_name.dart';
import 'package:cricstreamer/screeens/verify_token.dart';
import 'package:cricstreamer/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/button.dart';
import '../widgets/circle_logo.dart';
import '../widgets/size_box.dart';
import '../widgets/text_input.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController email = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _userViewMode = Provider.of<UserViewModel>(context);
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
                      "Reset Password",
                      style: green_style1,
                    ),
                    SizeBox(
                      height: 22,
                    ),
                    CircleLogo(
                      image: "assests/images/password.png",
                    ),
                    SizeBox(
                      height: 71,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "An email with the reset code will be send to the email you will provide below.",
                        style: gray_style3,
                      ),
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    TextInput(
                      textlabel: "Email",
                      iconlabel: "assests/images/email.png",
                      controller: email,
                    ),
                    SizeBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                    ),
                    Button(
                        title: "Next",
                        isLoading: _userViewMode.resetPassword.status == Status.LOADING?true:false,
                        func: () {
                          print("api calling");
                          _userViewMode.resetPasswordApi(
                              jsonEncode(
                                  {"email": email.text.trim().toString()}),
                              context);
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
                    const Text("Don't have an account!", style: gray_style3),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, RouteName.signUp,(route) => false);
                        },
                        child: Text("Create Account", style: gray_style1)),
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
