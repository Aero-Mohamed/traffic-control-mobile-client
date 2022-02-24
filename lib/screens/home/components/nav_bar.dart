import 'package:firefluth/models/nav_bar.dart';
import 'package:firefluth/screens/home/components/polish/custom_clipper_oval.dart';
import 'package:firefluth/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class NavBar extends StatefulWidget {
  final TabController tabController;
  NavBar({
    required Key key,
    required this.tabController,
  }): super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: SizeConfig.screenWidth,
      height: 100,
      bottom: 0,
      child: Container(
        height: getProportionateScreenWidth(93),
        child: Stack(children: [
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: NavBarClipper(),
              child: Container(
                height: getProportionateScreenWidth(50),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  gradient: kPrimaryGradientColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenWidth(35),
            width: SizeConfig.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(0, widget.tabController, Icons.map, context),
                SizedBox(width: 1,),
                _buildNavItem(1, widget.tabController, Icons.play_arrow, context),
                SizedBox(width: 1,),
                _buildNavItem(2, widget.tabController, Icons.search, context),
              ],
            ),
          ),
        ]),
      ),
    );
  }


  _buildNavItem(int tabIndex, TabController tabController,  IconData icon, BuildContext context){
    final NavBarData navbarData = Provider.of<NavBarData>(context);
    return ClipOvalShadow(
      shadow: Shadow(
        color: Colors.black12,
        blurRadius: 3,
      ),
      clipper: CustomClipperOval(),
      child: ClipOval(
        child: Material(
          color: tabIndex == context.watch<NavBarData>().activeItemIndex ? Colors.white.withOpacity(0.8): kPrimaryColor,
          child: InkWell(
            splashColor: kPrimaryLightColor,
            child: SizedBox(
              width: getProportionateScreenWidth(55),
              height: getProportionateScreenWidth(55),
              child: Icon(icon, size: getProportionateScreenWidth(28), color: tabIndex == context.watch<NavBarData>().activeItemIndex ? kPrimaryColor: Colors.white),
            ),
            onTap: (){
              tabController.animateTo(tabIndex);
              navbarData.activeItemIndex = tabIndex;
            },
          ),
        ),
      ),
    );
  }
}


/// Drawing the navBar Curves
class NavBarClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    double tabCount = 3;

    for(var i = 0; i < tabCount; i++){
      path.cubicTo( (1 + i*4) * sw/(tabCount*4), 0, (1 + i*4) * sw/(tabCount*4), 2*sh/5, (2 + i*4) * sw/(tabCount*4), 2*sh/5);
      path.cubicTo( (3 + i*4) * sw/(tabCount*4),  2*sh/5, (3 + i*4) * sw/(tabCount*4), 0, (4 + i*4) * sw/(tabCount*4), 0);
    }
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}