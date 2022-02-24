import 'package:flutter/material.dart';

class NavBarData extends ChangeNotifier {
  int _activeItemIndex = 0;
  bool _isDrawerOpen = false;


  int get activeItemIndex => _activeItemIndex;
  bool get isDrawerOpen => _isDrawerOpen;



  set activeItemIndex(int value){
    _activeItemIndex = value;
    notifyListeners();
  }
  set isDrawerOpen(bool value){
    _isDrawerOpen = value;
    notifyListeners();
  }

}