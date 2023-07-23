import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/add_button.dart';
import '../widgets/button.dart';
import '../widgets/text_input.dart';


class AddPlayers extends StatefulWidget {
  String backgroundImage;
  String logoImage;
  AddPlayers({Key? key,required this.backgroundImage,required this.logoImage}) : super(key: key);

  @override
  State<AddPlayers> createState() => _AddPlayersState();
}

class _AddPlayersState extends State<AddPlayers> {
  late String _backgroundImage;
  late String _logoImage;
  final TextEditingController player_name = TextEditingController();
  final TextEditingController player_cnic = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _backgroundImage = widget.backgroundImage;
    _logoImage = widget.logoImage;
  }
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
        title: const Text("Add Players", style: green_style3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(18),
          child: Column(
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
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(_backgroundImage),
                                      height: MediaQuery.of(context).size.height*0.252,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )
                                    )
                                )
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
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(_logoImage),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                  )
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 22,),
                    Text("Cricstreamer",style: gray_dark_style1),
                    SizedBox(height: 6,),
                    Text("we are tiger of latchi",style: gray_style2,),
                    SizedBox(height: 22,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: gray_dark,
                          height: 45,
                          width: MediaQuery.of(context).size.width*0.4355,
                        ),
                        Container(
                          color: Colors.red,
                          height: 45,
                          width: MediaQuery.of(context).size.width*0.4355,
                        )
                      ],
                    ),
                    TextInput(
                      textlabel: "Player Name",
                      iconlabel: "null",
                      controller: player_name,
                    ),
                    SizedBox(height: 18,),
                    TextInput(
                      textlabel: "CNIC (Example: 1111111111111)",
                      iconlabel: "null",
                      controller: player_cnic,
                    ),
                    // SizedBox(height: 18,),
                    SizedBox(height: 18,),
                    AddButton("Add Player", () { }, Icon(Icons.add,size: 30,color: gray_dark,),),

                  ],
                ),
              ),
              SizedBox(height: 18,),
              Positioned(
                bottom: 0,
                child: Button(
                  func: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectImages()));
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
