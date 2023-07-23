import 'dart:convert';

import 'package:cricstreamer/constants/box_decoration.dart';
import 'package:cricstreamer/constants/box_shadows.dart';
import 'package:cricstreamer/constants/colors.dart';
import 'package:cricstreamer/constants/text_styles.dart';
import 'package:cricstreamer/res/routes/route_name.dart';
import 'package:cricstreamer/screeens/login.dart';
import 'package:cricstreamer/view_model/user_view_model.dart';
import 'package:cricstreamer/widgets/button.dart';
import 'package:cricstreamer/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/size_box.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm_pasword = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    // TODO: implement dispose
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirm_pasword.dispose();
    super.dispose();
  }

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
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 30),
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height / 7.7),
                width: MediaQuery.of(context).size.width,
                decoration: boxDecoration1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Create Account", style: green_style1),
                    SizeBox(
                      height: 12,
                    ),
                    const Text("Hello!", style: gray_style2),
                    SizeBox(
                      height: 6,
                    ),
                    const Text("You are few step away!", style: gray_style3),
                    SizeBox(
                      height: 12,
                    ),
                    TextInput(
                      textlabel: "Username",
                      controller: username,
                      iconlabel: 'assests/images/username.png',
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    TextInput(
                      textlabel: "Email",
                      controller: email,
                      iconlabel: 'assests/images/email.png',
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    TextInput(
                      textlabel: "Phone",
                      controller: phone,
                      iconlabel: 'assests/images/phone.png',
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    TextInput(
                      textlabel: "Password",
                      controller: password,
                      iconlabel: 'assests/images/password.png',
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    TextInput(
                      textlabel: "Confirm Password",
                      controller: confirm_pasword,
                      iconlabel: 'assests/images/password.png',
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: green_dark,
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: gray),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                text: "I accept the ",
                                style: TextStyle(
                                  color: gray,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Term of Use",
                                    style: TextStyle(
                                        color: green_dark,
                                        decoration: TextDecoration.underline),
                                  ),
                                  TextSpan(text: " & "),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                        color: green_dark,
                                        decoration: TextDecoration.underline),
                                  ),
                                  TextSpan(text: " of Cricstreamer.")
                                ]),
                          ),
                        )
                      ],
                    ),
                    SizeBox(
                      height: 18,
                    ),
                    Button(
                      title: "Create Account",
                      isLoading: userViewMode.isSignUpLoading,
                      func: () {
                        if(userViewMode.isSignUpLoading == false && isChecked == true && password.text.trim().toString() == confirm_pasword.text.trim().toString()){
                          userViewMode.signUpApi(json.encode({
                            "name":username.text.trim().toString(),
                            "email":email.text.trim().toString(),
                            "password": password.text.trim().toString(),
                            "phoneNo": phone.text.trim().toString(),
                          }), context);
                        }
                      },
                    ),
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
                    Text("Already have an account!", style: gray_style3),
                    GestureDetector(onTap:(){
                      Navigator.pushNamedAndRemoveUntil(context, RouteName.login, (route) => false);
                    },child: Text("Login", style: gray_style1)),
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
