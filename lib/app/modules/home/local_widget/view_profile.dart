import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/global_widget.dart/button2.dart';
import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:bringideas/app/modules/home/local_widget/button_closed.dart';
import 'package:bringideas/app/modules/home/local_widget/header_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          HeaderProfile(),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
            child: Container(
              padding: EdgeInsets.only(
                  left: kDefaultPadding, right: kDefaultPadding),
              height: 60.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image(image: AssetImage(ICON_ACOUNT)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Text('Ajustes de cuenta'),
                    ),
                  ),
                  Image(image: AssetImage(ICON_EDIT)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            child: Container(
              padding: EdgeInsets.only(
                  left: kDefaultPadding, right: kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  builRow(ICON_IDIOMA, 'Idioma'),
                  SizedBox(
                    height: 15.0,
                  ),
                  builRow(ICON_SOPORTE, 'Soporte'),
                  SizedBox(
                    height: 15.0,
                  ),
                  builRow(ICON_CALIFICA, 'Calificanos'),
                  SizedBox(
                    height: 15.0,
                  ),
                  builRow(ICON_VERSION, 'Nueva versión'),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonClosed(),
        ],
      ),
    );
  }

  Widget builRow(String icon, title) {
    return Padding(
      padding: EdgeInsets.only(
          left: kDefaultPadding * 2, right: kDefaultPadding * 2),
      child: Row(
        children: [
          Image(image: AssetImage(icon)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding),
              child: Text(title),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
