import 'package:get/get.dart';
import 'package:ridesharing/modules/account/history/history_view.dart';
import 'package:ridesharing/modules/account/profile/profile_view.dart';
import 'package:ridesharing/modules/login/sign/sign_view.dart';
import 'package:ridesharing/modules/message/message_view.dart';
import 'package:ridesharing/modules/root/root_view.dart';
import 'package:ridesharing/modules/trip/trip_view.dart';

import '../modules/account/account_view.dart';
import '../modules/login/login_view.dart';
import '../modules/root/root_binding.dart';
import '../modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.ROOT,
      binding: RootBinding(),
      page: () => RootPage(),
    ),
    GetPage(
      name: Routes.MESSAGE,
      page: () => MessagePage(),
    ),
    GetPage(
      name: Routes.TRIP,
      page: () => TripPage(),
    ),
    GetPage(
      name: Routes.ACCOUT,
      page: () => AccountPage(),
    ),
    GetPage(
      name: Routes.HISTORYPAGE,
      page: () => HistoryPage(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignPage(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
    ),
  ];
}
