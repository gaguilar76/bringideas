import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputMail extends StatefulWidget {
  @override
  State<InputMail> createState() => _InputMailState();
}

class _InputMailState extends State<InputMail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => TextFormField(
        controller: _.mailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: kPrimaryColor,
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
          labelText: 'Correo electrónico',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 12,
          ),
        ),
        autofocus: false,
        validator: (value) {
          _.errorStringMail = "";
          if (_.isButtonPressed) {
            _.isErrorMail = true;
            if (value!.isEmpty) {
              _.errorStringMail = 'Correo de usuario inválido';
              return _.errorStringMail;
            }
            _.isErrorMail = false;
            _.errorStringMail = '';
          } else {
            _.errorStringMail = '';
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
