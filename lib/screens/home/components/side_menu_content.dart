import 'package:firefluth/models/user.dart';
import 'package:firefluth/screens/home/components/side_menu_parts/content.dart';
import 'package:firefluth/screens/home/components/side_menu_parts/copy_right.dart';
import 'package:firefluth/screens/home/components/side_menu_parts/top_part.dart';
import 'package:firefluth/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return SingleChildScrollView(
      child: Column(
        children: [
          topPart(),
          menuListContent(),
          CopyRight(),
        ],
      ),
    );
  }
}


