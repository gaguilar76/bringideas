import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderDescubreDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Container(
        height: 80.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          color: Colors.green,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding),
              child: GestureDetector(
                onTap: () {
                  _.setBackDetail(0);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Detalle del Destino',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
