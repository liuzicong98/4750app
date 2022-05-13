import 'dart:async';

import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashLogic extends GetxController {
  int time = 2;
  Timer? _timer;

  void goLogin() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      time--;
      if (time <= 0) {
        Get.offAndToNamed(Routes.LOGIN);
        _timer!.cancel();
      }
    });
  }
}
