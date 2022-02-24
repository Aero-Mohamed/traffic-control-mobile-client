import 'package:flutter/material.dart';
import 'package:firefluth/screens/splash/components/body.dart';
import 'package:firefluth/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splashScreen';
  @override
  Widget build(BuildContext context) {
    // call it on starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: SplashScreenBody()
    );
  }
}
