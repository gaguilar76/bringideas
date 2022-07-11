import 'package:bringideas/app/modules/home/home_binding.dart';
import 'package:bringideas/app/modules/home/home_page.dart';
import 'package:bringideas/app/modules/login/login_binding.dart';
import 'package:bringideas/app/modules/login/login_page.dart';
import 'package:bringideas/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
