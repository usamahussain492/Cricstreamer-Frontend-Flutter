import 'dart:convert';

import 'package:cricstreamer/data/response/status.dart';
import 'package:cricstreamer/screeens/home.dart';
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

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController confirm_password = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userViewMode = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: white_light,
          child: Column(
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
                      "Change Password",
                      style: green_style1,
                    ),
                    SizeBox(
                      height: 22,
                    ),
                    CircleLogo(
                      image: "assests/images/password.png",
                    ),
                    SizeBox(
                      height: 72,
                    ),
                    TextInput(
                      textlabel: "Password",
                      iconlabel: "assests/images/password.png",
                      controller: password,
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    TextInput(
                      textlabel: "Confirm Password",
                      iconlabel: "assests/images/password.png",
                      controller: confirm_password,
                    ),
                    SizeBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                    ),
                    Button(
                        title: "Save Changes",
                        isLoading: userViewMode.changePasswordResponse.status ==
                                Status.COMPLETED
                            ? true
                            : false,
                        func: () {
                          if (password.text.trim().toString() ==
                              confirm_password.text.trim().toString()) {
                            print(userViewMode
                                .verifyOtpResponse.data['data']['_id']
                                .toString());
                            userViewMode.changePasswordApi(
                                jsonEncode({
                                  "userId": userViewMode
                                      .verifyOtpResponse.data['data']['_id']
                                      .toString(),
                                  "password": password.text.trim().toString()
                                }),
                                context);
                          }
                        }),
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
