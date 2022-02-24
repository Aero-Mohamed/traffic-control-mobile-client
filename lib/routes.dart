
import 'package:firefluth/screens/forget_password/forget_password_screen.dart';
import 'package:firefluth/screens/home/my_home_screen.dart';
import 'package:firefluth/screens/sign_in/sign_in_screen.dart';
import 'package:firefluth/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  MyHomeScreen.routeName: (context) => MyHomeScreen(),
};