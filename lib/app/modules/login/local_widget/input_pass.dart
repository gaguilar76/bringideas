import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPass extends StatefulWidget {
  @override
  State<InputPass> createState() => _InputPassState();
}

class _InputPassState extends State<InputPass> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => TextFormField(
        controller: _.passController,
        keyboardType: TextInputType.text,
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kColorBorderSide),
            borderRadius: BorderRadius.circular(inputTextRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kColorBorderSide),
            borderRadius: BorderRadius.circular(inputTextRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kColorBorderSide),
            borderRadius: BorderRadius.circular(inputTextRadius),
          ),
          labelText: 'Contraseña',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 12,
          ),
        ),
        autofocus: false,
        validator: (value) {
          _.errorStringPassword = "";
          if (_.isButtonPressed) {
            _.isErrorPassword = true;
            if (value!.isEmpty) {
              _.errorStringPassword = 'Favor de agregar una contraseña';
              return _.errorStringPassword;
            }
            _.isErrorPassword = false;
            _.errorStringPassword = '';
          } else {
            _.errorStringPassword = '';
          }
          setState(() {});
        },
        onChanged: (String newVal) {
          //_.checkBotonPass();
        },
      ),
    );
  }
}
