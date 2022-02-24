
import 'package:firefluth/models/nav_bar.dart';
import 'package:firefluth/providers/Featured/featured_index_notifier.dart';
import 'package:firefluth/screens/home/components/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'pages/courses_page.dart';
import 'pages/search_page.dart';
import 'pages/featured_page.dart';
import 'nav_bar.dart';

class MyHomeScreenBody extends StatefulWidget {
  @override
  _MyHomeScreenBodyState createState() => _MyHomeScreenBodyState();
}

class _MyHomeScreenBodyState extends State<MyHomeScreenBody> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);


    // tabController.animateTo(2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// update navBar index when change happens by dragging
    NavBarData navBarData = Provider.of<NavBarData>(context);
    tabController.addListener(() {
      if(tabController.index != tabController.previousIndex) {
        // Tab Changed swiping to a new tab
        navBarData.activeItemIndex = tabController.index;
      }

    });

    return Scaffold(
      body: SafeArea(

        child: Stack(
          children: [
            /// Tabs Content
            TabBarView(
              controller: tabController,
              children: <Widget>[
                CoursesPage(),
                MultiProvider(
                    providers: [
                      ChangeNotifierProvider<FeaturedIndexNotifier>(
                        create: (_) => FeaturedIndexNotifier(),
                      ),
                    ],
                    child: FeaturedPage()
                ),
                SearchPage(),
              ],
            ),
            /// Bottom NavBar
            NavBar( tabController: tabController, key: Key('NavBar1')),
            HomeScreenSideMenu(),

          ],
        ),
      ),
      // bottomNavigationBar: NavBar( tabController: tabController,),
    );
  }
}










