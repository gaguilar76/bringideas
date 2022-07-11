import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/config/utils.dart';
import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:bringideas/app/modules/home/local_widget/card_notice.dart';
import 'package:bringideas/app/modules/home/local_widget/custom_bottom_bar.dart';
import 'package:bringideas/app/modules/home/local_widget/header.dart';
import 'package:bringideas/app/modules/home/local_widget/view_descubre.dart';
import 'package:bringideas/app/modules/home/local_widget/view_home.dart';
import 'package:bringideas/app/modules/home/local_widget/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Color(0xFFf6f6f6),
          body: SafeArea(
            child: SingleChildScrollView(
              child: _.loading
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height / 2,
                        ),
                        Text('Obteniendo información...'),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(),
                      ],
                    ))
                  : _.indexPage == 0
                      ? ViewHome()
                      : _.indexPage == 1
                          ? ViewDescubre()
                          : _.indexPage == 2
                              ? ViewProfile()
                              : Container(),
            ),
          ),
          bottomNavigationBar: CustomBottomBar(),
        ),
      ),
    );
  }
}
