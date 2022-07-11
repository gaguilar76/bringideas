import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:bringideas/app/modules/home/local_widget/card_place.dart';
import 'package:bringideas/app/modules/home/local_widget/header_descubre.dart';
import 'package:bringideas/app/modules/home/local_widget/header_descubre_detail.dart';
import 'package:bringideas/app/modules/home/local_widget/view_descubre_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewDescubre extends StatelessWidget {
  const ViewDescubre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _.indexPageDetail == 0
              ? HeaderDescubre(
                  title: 'Descubre tus destinos favoritos\nen ' + _.strLocality)
              : HeaderDescubreDetail(),
          SizedBox(
            height: 20.0,
          ),
          for (var i = 0; i < _.listPlace.length; i++)
            _.indexPageDetail == 0 ? CardPlace(_.listPlace[i]) : Container(),
          _.indexPageDetail == 1 ? ViewDescubreDetail() : Container(),
        ],
      ),
    );
  }
}
