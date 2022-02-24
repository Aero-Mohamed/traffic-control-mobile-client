import 'package:flutter/material.dart';

import '../../../../constants.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.search, size: 100, color: kPrimaryLightColor,),
      ),
    );
  }
}