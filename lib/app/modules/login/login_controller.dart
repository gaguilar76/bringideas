import 'package:bringideas/app/config/utils.dart';
import 'package:bringideas/app/models/user.dart';
import 'package:bringideas/app/repository/main_repository.dart';
import 'package:bringideas/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passController = TextEditingController();
  bool isButtonPressed = false;
  bool isWriting = false;
  String errorStringPassword = "";
  bool isErrorPassword = false;
  String errorStringMail = "";
  bool isErrorMail = false;

  @override
  void onInit() {
    super.onInit();
    loadDatabase();
  }

  loadDatabase() async {
    await Get.find<MainRepository>().loadUserDB();
  }

  checkValidaUsuario() async {
    final _mail = mailController.text;
    final _password = passController.text;
    User? user =
        await Get.find<MainRepository>().validaUserDB(_mail, _password);
    if (user == null) {
      Utils.snackErrorMessagge('Error', 'Usuario / contraseña inválido');
    } else {
      mailController.text = '';
      passController.text = '';
      Utils.userName = user.userName!;
      Utils.mailName = user.userMail!;
      Get.toNamed(AppRoutes.HOME);
    }
  }
}
