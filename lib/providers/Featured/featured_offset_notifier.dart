import 'package:flutter/material.dart';

class FeaturedOffsetNotifier with ChangeNotifier{
  double _page = 0;

  double get page => _page;

  FeaturedOffsetNotifier(PageController pageController){
    pageController.addListener(() {
      _page = pageController.page!;
      print('Page is: $_page');
      notifyListeners();
    });
  }
}