import 'package:firefluth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../size_config.dart';


// ignore: camel_case_types
class topPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User userProfile = Provider.of<User>(context);
    return ClipPath(
      clipper: menuTopPartClipper(),
      child: Container(
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(40),
            left: getProportionateScreenWidth(25), 
            right: getProportionateScreenWidth(20), 
            bottom: getProportionateScreenHeight(40)
        ),
        width: SizeConfig.screenWidth,
        height: (SizeConfig.screenHeight * 0.38),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: getProportionateScreenHeight(13)),
              width: getProportionateScreenHeight(90),
              height: getProportionateScreenHeight(90),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  boxShadow: [
                    BoxShadow(blurRadius: 7, spreadRadius: 3, offset: Offset(4, 6), color: Colors.black.withOpacity(0.3)),
                    BoxShadow(blurRadius: 7, spreadRadius: 3, offset: Offset(-4, -6), color: Colors.white.withOpacity(0.3)),
                  ]
              ),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                backgroundImage: (userProfile.profilePicture != null)? NetworkImage(userProfile.profilePicture): null,

              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.8,
              child: Text(
                  userProfile.name,
                  style: TextStyle(fontSize: getProportionateScreenWidth(22), color: Colors.black, fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.8,
              child: Text(
                  userProfile.email,
                  style: TextStyle(fontSize: getProportionateScreenWidth(11), color: Colors.black)
                // overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}


// ignore: camel_case_types
class menuTopPartClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(0, sh*0.8);
    path.quadraticBezierTo(sw * 0.8 , sh * 0.8, sw, sh);
    path.lineTo(sw, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}