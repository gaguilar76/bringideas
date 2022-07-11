import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/global_widget.dart/button2.dart';
import 'package:bringideas/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Button2(
          title: 'Acceder',
          color: kColorButtonLogin,
          onPressed: () {
            FocusScope.of(context).unfocus();
            _.isWriting = false;
            _.isButtonPressed = true;
            if (_.formKey.currentState!.validate()) {
              _.checkValidaUsuario();
            } else {
              print('Error password...');
            }
          }),
    );
  }
}
