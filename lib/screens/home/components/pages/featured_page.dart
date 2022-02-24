
import 'package:firefluth/providers/Featured/featured_index_notifier.dart';
import 'package:firefluth/providers/Featured/featured_offset_notifier.dart';
import 'package:firefluth/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';


class FeaturedPage extends StatefulWidget {
  @override
  _FeaturedPageState createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FeaturedIndexNotifier featuredIndexNotifier = Provider.of<FeaturedIndexNotifier>(context);
    return SingleChildScrollView(
      child: ChangeNotifierProvider(
        create: (context) => FeaturedOffsetNotifier(_pageController),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black26,
          child: PageView(
            controller: _pageController,
            onPageChanged: (int index){
              featuredIndexNotifier.index = index;
            },
            children: [
              /// item
              Consumer<FeaturedOffsetNotifier>(
                builder: (context, notifire, child){
                  return Transform.scale(
                    scale: math.max(0, 1 - notifire.page),
                    child: Opacity(
                      opacity: math.max(0, 1 - notifire.page),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: 100,
                  height: 20,
                  color:Colors.red,
                  child: Text('lool'),
                )
              ),
              Container(color:Colors.blue),
              Container(color:Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}