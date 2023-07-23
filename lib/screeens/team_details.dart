import 'dart:io';

import 'package:cricstreamer/screeens/add_players.dart';
import 'package:cricstreamer/widgets/add_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/button.dart';
import '../widgets/text_input.dart';

class TeamDetails extends StatefulWidget {

  const TeamDetails({Key? key}) : super(key: key);

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  final ImagePicker _picker = ImagePicker();
  late XFile backgroundImage;
  late XFile logoImage;
  bool isBackgoundSelected = false;
  bool isLogoSelected = false;
  final TextEditingController team_name = TextEditingController();
  final TextEditingController slogan = TextEditingController();
  final TextEditingController city = TextEditingController();

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
        title: const Text("Team Details", style: green_style3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-90,
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                    TextInput(
                      textlabel: "Team Name",
                      iconlabel: "null",
                      controller: team_name,
                    ),
                    SizedBox(height: 18,),
                    TextInput(
                      textlabel: "City",
                      iconlabel: "null",
                      controller: city,
                    ),
                    SizedBox(height: 18,),
                    TextInput(
                      textlabel: "Slogan",
                      iconlabel: "null",
                      controller: slogan,
                    ),
                    SizedBox(height: 18,),
                    AddButton("Add Team", () { }, Icon(Icons.add,size: 30,color: gray_dark,),),

                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Button(
                  func: () {
                    if(isBackgoundSelected != false || isLogoSelected != false){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPlayers(backgroundImage: backgroundImage.path, logoImage: logoImage.path)));
                    }

                  },
                  title: "Next",
                  colors: [
                    green_dark,
                    green_light,
                  ],
                  icon: "assests/images/arrow.png",
                  iconWidth: 13,
                  iconHeight: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
