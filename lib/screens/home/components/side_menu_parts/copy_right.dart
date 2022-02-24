import 'package:firefluth/constants.dart';
import 'package:firefluth/size_config.dart';
import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: copyRightClipper(),
      child: Container(
        width: double.infinity,
        height: 100,
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            '2022 '+APP_NAME+' All rights reserved.',
            style: TextStyle(
              color: kTextColor,
              fontSize: getProportionateScreenWidth(11),
            ),
          ),
        ),
      ),
    );
  }
}

class copyRightClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.quadraticBezierTo(sw/2, sh * 0.4, sw, sh*0.2);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}
