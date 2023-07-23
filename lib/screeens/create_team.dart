import 'dart:io';

import 'package:cricstreamer/screeens/team_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/button.dart';

class CreateTeam extends StatefulWidget {

  const CreateTeam({Key? key}) : super(key: key);

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  final ImagePicker _picker = ImagePicker();
  late XFile backgroundImage;
  late XFile logoImage;
  bool isBackgoundSelected = false;
  bool isLogoSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: green_light, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: true,
        title: const Text("Create Team", style: green_style3),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.252+50,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.252,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: isBackgoundSelected?Image.file(
                              File(backgroundImage.path),
                              height: MediaQuery.of(context).size.height*0.252,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ):Container(
                              color: gray_light,
                              width:  MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assests/images/default-image.png",width: 60,height: 60,fit: BoxFit.fill,),
                                  SizedBox(height: 8,),
                                  Text("Upload Cover Here",style: gray_style3,)
                                ],
                              ),
                            )
                          )
                        ),
                        GestureDetector(
                          onTap: ()async{
                            backgroundImage = (await _picker.pickImage(source: ImageSource.gallery))!;
                           setState((){
                              isBackgoundSelected = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: gray_dark,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image.asset("assests/images/camera-icon.png",width: 18,height: 18,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.white,
                          width: 3
                        ),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: isLogoSelected?Image.file(
                                    File(logoImage.path),
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ):Container(
                                    color: gray_light,
                                    width:  100,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Logo",style: gray_style2,),
                                        SizedBox(height: 8,)
                                      ],
                                    ),
                                  )
                              )
                          ),
                          GestureDetector(
                            onTap: ()async{
                              logoImage = (await _picker.pickImage(source: ImageSource.gallery))!;
                              setState((){
                                isLogoSelected = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(6),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: gray_dark,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Image.asset("assests/images/camera-icon.png",width: 18,height: 18,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 18,),
            Button(
              func: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TeamDetails()));
              },
              title: "Add Team A",
              colors: [
                green_dark,
                green_light,
              ],
              icon: "assests/images/plus-icon.png",
            ),
          ],
        ),
      ),
    );
  }
}
