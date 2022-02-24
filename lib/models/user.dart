
import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier{
  late int _user_id;
  late String _name;
  late String _email;
  late String _city;
  late String _country;
  late String _phone;
  late String _profilePicture;

  /// Define Getters
  int get user_id => _user_id;
  String get name => _name;
  String get email => _email;
  String get city => _city;
  String get country => _country;
  String get phone => _phone;
  String get profilePicture => _profilePicture;

  /// Define Setters
  set user_id (int val){
    _user_id = val;
    notifyListeners();
  }
  set name (String val){
    _name = val;
    notifyListeners();
  }
  set email (String val){
    _email = val;
    notifyListeners();
  }
  set city (String val){
    _city = val;
    notifyListeners();
  }
  set country (String val){
    _country = val;
    notifyListeners();
  }
  set phone (String val){
    _phone = val;
    notifyListeners();
  }
  set profilePicture (String val){
      _profilePicture = val;
      notifyListeners();
  }


}