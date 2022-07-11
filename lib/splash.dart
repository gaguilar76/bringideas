import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Get.offNamed(AppRoutes.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ICON_AIRPLANE,
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                'Xperiences',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'Disfruta una aventura de viaje',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
