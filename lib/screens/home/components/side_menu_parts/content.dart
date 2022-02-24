import 'package:firefluth/constants.dart';
import 'package:firefluth/models/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../size_config.dart';

// ignore: camel_case_types
class menuListContent extends StatefulWidget {
  @override
  _menuListContentState createState() => _menuListContentState();
}

// ignore: camel_case_types
class _menuListContentState extends State<menuListContent> {
  @override
  Widget build(BuildContext context) {
    NavBarData navBar = Provider.of<NavBarData>(context);
    return Container(
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(30),
          right: getProportionateScreenWidth(30)
      ),
      padding: EdgeInsets.only(
        bottom: 50,
      ),
      child: Column(
        children: [
          _menuItemBuilder(Icons.home, 'Home', (){
            navBar.isDrawerOpen = false;
          }),
          _menuItemBuilder(Icons.supervised_user_circle, 'Profile', (){}),
          _menuItemBuilder(Icons.navigation, 'Trip History', (){}),
          _menuItemBuilder(Icons.settings_applications, 'Settings', (){}),
          // _menuItemBuilder(Icons.play_circle_filled, 'My Courses', (){}),
          // _menuItemBuilder(Icons.insert_chart, 'Exam Analytics', (){}),
          // _menuItemBuilder(Icons.live_help, 'FAQ', (){}),
          // _menuItemBuilder(Icons.videocam, 'Free Videos', (){}),
          // _menuItemBuilder(Icons.cloud_download, 'Study Material', (){}),
          // _menuItemBuilder(Icons.feedback, 'Feedback', (){}),
          _menuItemBuilder(Icons.close, 'Logout', (){}),
        ],
      ),
    );
  }

  _menuItemBuilder(IconData icon, String text, VoidCallback onTapCallBack){
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: getProportionateScreenHeight(60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10,),
                  Icon(icon, color: Colors.white, size: 35),
                  SizedBox(width: 30,),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(17),
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            ),
            onTap: onTapCallBack,
          ),
        ),
        Divider(thickness: 2,),
      ],
    );
  }
}
