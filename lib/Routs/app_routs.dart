import 'package:get/get.dart';
import 'package:login/Pushnotification/welcome_page.dart';
import 'package:login/googlelogin/welcome_googlelogin.dart';
import 'package:login/home_page.dart';

import '../facebooklogin/welcome_facebooklogin.dart';

class Routes {
  static const homePage = "/homePage";
  static const googleLoginPage = "/googleLoginPage";
  static const facebookLoginPage = "/facebookLoginPage";
  static const notifyPage = "/notifyPage";

  static final pages = [
    GetPage(name: Routes.homePage, page: () => HomePage()),
    GetPage(name: Routes.googleLoginPage, page: () => GoogleLoginPage()),
    GetPage(name: Routes.facebookLoginPage, page: () => FacebookLoginPage()),
    GetPage(name: Routes.notifyPage, page: () => WelcomeNotify()),
  ];
}
