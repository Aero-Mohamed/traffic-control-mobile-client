import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF3186f5);
const kPrimaryLightColor = Color(0xFF46aef0);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [ kPrimaryColor, kPrimaryLightColor]
);
const kSecondaryColor = Color(0xFFeeeeee);

const kTextColor = Color(0xFF757575);
const kHeadTextColor = Color(0xFF3186f5);

const kAnimationDuration = Duration(milliseconds: 250);

final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9\-]+\.[a-zA-Z]+");
const String APP_NAME = "Cairoutes";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please enter your Password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";

/// Pusher
const String PusherKey = "SkyWirePusherKey";
const String PusherHost = "10.0.2.2";
const int PusherPort = 6001;
const String PusherCluster = "mt1";
/// API Routes
/// all have api prefix
const String domainName = '10.0.2.2';
const String apiAuth = '/SkyWire/public/oauth/token'; /// POST
const String apiProfile = '/SkyWire/public/api/v1/user'; /// GET