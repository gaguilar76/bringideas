import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/data_source/rest_data.dart';
import 'package:bringideas/app/repository/main_repository.dart';
import 'package:bringideas/app/routes/app_pages.dart';
import 'package:bringideas/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final restData = RestData();
  final mainRepository = MainRepository(restData);
  Get.put(mainRepository);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Bring Ideas',
      debugShowCheckedModeBanner: false,
      home: Splash(),
      getPages: AppPages.pages,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
