import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static String userName = '';
  static String mailName = '';
  static String clima = '';

  static void snackErrorMessagge(String title, String subtitle) {
    Get.snackbar(
      title,
      subtitle,
      icon: Icon(Icons.error, color: Colors.red),
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.TOP,
    );
  }
}
