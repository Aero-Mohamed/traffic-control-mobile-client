
import 'package:firefluth/components/custom_suffix_icon.dart';
import 'package:firefluth/components/default_button.dart';
import 'package:firefluth/components/form_errors.dart';
import 'package:firefluth/screens/forget_password/forget_password_screen.dart';
import 'package:firefluth/screens/home/my_home_screen.dart';
import 'package:firefluth/screens/splash/splash_screen.dart';
import 'package:firefluth/services/Auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  final List<String> errors = [];
  final focus = FocusNode();
  bool loading = false;

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenWidth(20),),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenWidth(20),),
          FormError(
            errors: errors, key: Key('FormError2'),
          ),
          SizedBox(height: getProportionateScreenWidth(20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                      decoration: TextDecoration.underline
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(20),),
          loading ?
          SpinKitDoubleBounce(
            color: kPrimaryLightColor,
            size: 50.0,
          )
          :DefaultButton(
            text: 'Login',
            pressed: () async {
              setState(() {
                loading = true;
              });
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();

                bool authenticated = await authService.auth(email, password);
                if(authenticated){
                  /// get user data
                  /// navigate to home screen.
                  Navigator.popAndPushNamed(context, SplashScreen.routeName);
                }
              }
              setState(() {
                loading = false;
              });
            }, key: Key('LoginBtn'),
          ),
        ],
      ),
    );
  }
  TextFormField buildEmailFormField(){
    return TextFormField(
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v){
        FocusScope.of(context).requestFocus(focus);
      },
      onSaved: (newValue) => email = newValue!,
      onChanged: (value){
        if(value.isNotEmpty && errors.contains(kEmailNullError)){
          setState((){
            errors.remove(kEmailNullError);
          });

        }else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value){
        if(value!.isEmpty && !errors.contains(kEmailNullError)){
          setState((){
            errors.add(kEmailNullError);
          });

        }else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/Mail.svg', key: Key('suffixIcon1'),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField(){
    return TextFormField(
      focusNode: focus,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value){
        if(value.isNotEmpty && errors.contains(kPassNullError)){
          setState((){
            errors.remove(kPassNullError);
          });
        }else if(value.length >= 6 && errors.contains(kShortPassError)){
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value){
        if(value!.isEmpty && !errors.contains(kPassNullError)){
          setState((){
            errors.add(kPassNullError);
          });
        }else if(value.length < 6 && !errors.contains(kShortPassError)){
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/Lock.svg', key: Key('suffixIcon2'),
        ),
      ),
    );
  }
}
