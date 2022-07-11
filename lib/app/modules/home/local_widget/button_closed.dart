import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonClosed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Container(
          height: 50.0,
          child: RaisedButton(
            onPressed: () {
              _.closeSession();
            },
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.red,
            child: Text(
              'Cerrar sesión',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
