import 'package:firefluth/constants.dart';
import 'package:firefluth/models/nav_bar.dart';
import 'package:firefluth/screens/home/components/nav_bar.dart';
import 'package:firefluth/screens/home/components/side_menu_content.dart';
import 'package:firefluth/size_config.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenSideMenu extends StatefulWidget {
  @override
  _HomeScreenSideMenuState createState() => _HomeScreenSideMenuState();
}

class _HomeScreenSideMenuState extends State<HomeScreenSideMenu> {

  @override
  Widget build(BuildContext context) {
    NavBarData navBar = Provider.of<NavBarData>(context);
    return AnimatedPositioned(
      curve: Curves.elasticInOut,
      duration: Duration(milliseconds: 2000),
      /// on change status
      /// change the left, and the shadow offset
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      left: navBar.isDrawerOpen ? 0 : - SizeConfig.screenWidth + getProportionateScreenWidth(40),
      // left: 0,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: kPrimaryGradientColor,
                // color: kPrimaryColor,
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(navBar.isDrawerOpen ? 3: -10, 0)
                )],
              ),
              child: Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: SideMenuContent(),
              ),
            ),
          ),
          Align(

            alignment: Alignment(0, -0.8),
            child: ClipPath(
              clipper: ToggleBtnClipper(),
              child: Container(
                width: getProportionateScreenWidth(40),
                height: getProportionateScreenHeight(150),
                color: Colors.black,
                child: Container(
                  width: 5,
                  height: 10,
                  child: GestureDetector(
                    child: FlareActor(
                      'assets/flare/menu.flr',
                      animation: navBar.isDrawerOpen ? 'active': 'disable',
                    ),
                    onTap: (){
                      setState(() {
                        navBar.isDrawerOpen = !navBar.isDrawerOpen;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

class ToggleBtnClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(0, sh/4, sw, sh/4, sw, sh/2);
    path.cubicTo(sw, 3*sh/4, 0, 3*sh/4, 0, sh);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
