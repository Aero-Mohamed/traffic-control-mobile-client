
import 'package:flutter/material.dart';

import 'components/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = '/forgetPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget'),
      ),
      body: ForgetPasswordScreenBody(),
    );
  }
}


