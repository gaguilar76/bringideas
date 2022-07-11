import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/modules/login/local_widget/button_login.dart';
import 'package:bringideas/app/modules/login/local_widget/input_mail.dart';
import 'package:bringideas/app/modules/login/local_widget/input_pass.dart';
import 'package:bringideas/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) => Scaffold(
              body: Form(
                key: _.formKey,
                child: Center(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ICON_BACKPACK,
                        width: 200.0,
                        height: 200.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Bienvenido',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Inicia sesión para disfrutar\nlos beneficios de la experiencia',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: kDefaultPadding, right: kDefaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: kPaddingInput, right: kPaddingInput),
                                child: InputMail(),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: kPaddingInput, right: kPaddingInput),
                                child: InputPass(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding, right: kDefaultPadding),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: kPaddingInput, right: kPaddingInput),
                          child: ButtonLogin(),
                        ),
                      ),
                    ],
                  ),
                )),
                onChanged: () {
                  if (_.isButtonPressed) {
                    _.isWriting = true;
                    _.isButtonPressed = false;
                    _.errorStringMail = '';
                    _.errorStringPassword = '';
                    _.formKey.currentState?.validate();
                  }
                },
              ),
            ));
  }
}
