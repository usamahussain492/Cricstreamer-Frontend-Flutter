import 'package:cricstreamer/constants/text_styles.dart';
import 'package:cricstreamer/screeens/feed.dart';
import 'package:cricstreamer/screeens/highlights.dart';
import 'package:cricstreamer/screeens/market.dart';
import 'package:cricstreamer/screeens/shorts.dart';
import 'package:cricstreamer/widgets/custom_drawer.dart';
import 'package:cricstreamer/widgets/drawer_list_tile.dart';
import 'package:cricstreamer/screeens/add.dart';
import 'package:flutter/material.dart';

import '../constants/box_shadows.dart';
import '../constants/colors.dart';
import '../widgets/navbaritem.dart';

class Home extends StatefulWidget {
  bool showsearch = true;
  int currentPage = 2;
  Home({Key? key,this.currentPage = 2}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _showsearch;
  late int _currentpage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.showsearch = true;
    _showsearch = widget.showsearch;
    _currentpage = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final List _pages = [Feed(), Market(),Feed(), Highlights(), Shorts()];

    return Scaffold(
      drawer: _showsearch ? CustomDrawer() : null,
      appBar: AppBar(
        automaticallyImplyLeading: _showsearch,
        iconTheme: IconThemeData(color: gray_dark, size: 30),
        backgroundColor: white,
        titleSpacing: 0,
        shadowColor: gray,
        elevation: 1,
        title: _showsearch
            ? Text(
                "CRIC STREAMER",
                style: TextStyle(
                  color: gray_dark,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                      fontSize: 18.0, height: 1.0, color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    fillColor: gray_light,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide(color: gray_light, width: 0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide(color: gray_light, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide(color: gray_light, width: 0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide(color: gray_light, width: 0),
                    ),
                    suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _showsearch = !_showsearch;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            "assests/images/search.png",
                            width: 18,
                            height: 18,
                            color: green_dark,
                          ),
                        )),
                  ),
                ),
              ),
        actions: _showsearch
            ? [
                GestureDetector(
                  child: Image.asset(
                    "assests/images/search.png",
                    width: 23,
                    height: 23,
                  ),
                  onTap: () {
                    setState(() {
                      _showsearch = !_showsearch;
                      print(_showsearch);
                    });
                  },
                ),
                Padding(padding: EdgeInsets.only(right: 20))
              ]
            : null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int a) {
          setState(() {
            _currentpage = a;
          });
          if (a == 2) {
            _settingModalBottomSheet(context);
          }
        },
        fixedColor: gray_dark,
        unselectedItemColor: gray_dark,
        showUnselectedLabels: true,
        showSelectedLabels: false,
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
        ),
        // selectedLabelStyle: ,
        currentIndex: _currentpage,
        items: [
          NavbarItem("assests/images/feed.png", "Feed", "assests/images/feed-fill.png", 26, 26),
          NavbarItem("assests/images/store.png", "Market", "assests/images/store-fill.png", 26, 26),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  color: green_light,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: green_light, width: 2)),
              child: Icon(
                Icons.add,
                size: 29,
                color: Colors.white,
              ),
            ),
            icon: Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: green_light, width: 2)),
              child: Icon(
                Icons.add,
                size: 29,
                color: green_light,
              ),
            ),
            label: "",
          ),
          NavbarItem("assests/images/high_shorts.png", "Highlights", "assests/images/high_shorts.png",30, 30),
          NavbarItem("assests/images/high_shorts.png", "Shorts", "assests/images/high_shorts.png",30, 30),
        ],
      ),
      body: _pages[_currentpage],
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: false,
      barrierColor: gray,

      shape: const RoundedRectangleBorder( // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Add();
      });
}

