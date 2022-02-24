import 'package:flutter/material.dart';
import 'package:firefluth/size_config.dart';

import 'components/body.dart';


class MyHomeScreen extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    // call it on starting screen
    SizeConfig().init(context);
    return Scaffold(
        body: MyHomeScreenBody()
    );
  }

}
