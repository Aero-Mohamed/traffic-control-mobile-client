import 'dart:convert';
import 'package:firefluth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class AuthService {


  Future<Map<String, dynamic>?> fetchUserProfile() async {
    String? accessToken = await this.getAccessTokenFromPref();
    print("AccessToken-FetchUserProfile:");
    print(accessToken);
    http.Response response = await http.get(
      Uri.https(domainName, apiProfile),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
    );
    print(response.statusCode);
    print(response.body.toString());

    Map<String, dynamic> res = json.decode(response.body);

    if(response.statusCode == 200){
      // return User.fromJson(res);
      return res;
    }else{
      return null;
    }
  }


  /// Authenticate a user with email and password.
  Future<bool> auth(String email, String password) async {
    http.Response response = await http.post(
      Uri.https(domainName, apiAuth),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'grant_type': 'password',
        'client_id': '4',
        'client_secret': '8d9uUhFSBQf79f0HVOAMNyvF1ZlrgPmy7mMJkzV2',
        'username': email,
        'password': password
      })
    );

    print(response.statusCode);
    print(response.body.toString());

    Map<String, dynamic> res = json.decode(response.body);

    if(this.authValidate(res)){
      // store access token on Preferences.
      this.setLogInPref(res);
      // show success message.
      this.toastSuccess('You logged in');
      return true;
    }
    return false;
  }

  /// validate the response
  bool authValidate(Map<String, dynamic> res){
    if(res.containsKey('error')){
      if(res['error'] != 'invalid_request'){
        String errorMsg = res['error'] == 'invalid_credentials' ? 'Email or Password is not correct!': res['message'];
        this.toastError(errorMsg);
      }
      return false;
    }
    return true;
  }

  /// show error message
  void toastError(msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  /// show success massage
  void toastSuccess(msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  void setLogInPref(Map<String, dynamic> data) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token_type', data['token_type']);
    await preferences.setString('access_token', data['access_token']);
    await preferences.setString('refresh_token', data['refresh_token']);
  }

  Future<String?> getAccessTokenFromPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString('access_token');
    return token;
  }

  Future<void> unsetLogInPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token_type', '');
    preferences.setString('access_token', '');
    preferences.setString('refresh_token', '');
  }
}
