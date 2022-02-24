
import 'package:firefluth/components/custom_suffix_icon.dart';
import 'package:firefluth/components/default_button.dart';
import 'package:firefluth/components/form_errors.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ForgetPasswordForm extends StatefulWidget {
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenWidth(20),),
          FormError(
            key: Key('formError'),
            errors: errors,
          ),
          SizedBox(height: getProportionateScreenWidth(20),),
          SizedBox(height: getProportionateScreenWidth(20),),
          DefaultButton(
            key: Key('DefaultButton'),
            text: 'Login',
            pressed: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }
  TextFormField buildEmailFormField(){
    return TextFormField(
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
            key: Key('1'),
            svgIcon: 'assets/icons/Mail.svg'
        ),
      ),
    );
  }

}
