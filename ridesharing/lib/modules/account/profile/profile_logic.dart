import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ridesharing/http/dao/login_dao.dart';
import 'package:ridesharing/http/response/base_response_entity.dart';
import 'package:ridesharing/modules/account/account_logic.dart';
import 'package:ridesharing/service/app_service.dart';
import 'package:ridesharing/utils/toastUtils.dart';

class ProfileLogic extends GetxController {
  final emailCtl = TextEditingController().obs;
  final nameCtl = TextEditingController().obs;
  final pwdCtl = TextEditingController().obs;
  final numCtl = TextEditingController().obs;

  void submit() async {
    // String? id = Get.find<AppService>().user.value!.uid;
    // BaseResponseEntity entity = await LoginDao.updata(id!, nameCtl.value.text,
    //     pwdCtl.value.text, emailCtl.value.text, numCtl.value.text);
    // if (entity.code == 200) {
    //   ToastUtils.showToast('success');
    //   // Get.find<AppService>().user.value.displayName = nameCtl.value.text;
    //   // Get.find<AppService>().user.value.email = emailCtl.value.text;
    //   // Get.find<AppService>().user.value.number = numCtl.value.text;
    //   // Get.find<AppService>().user.value.password = pwdCtl.value.text;
    //   Get.find<AccountLogic>().update();

  //     Get.back();
  //   } else {
  //     ToastUtils.showToast('fail');
  //   }
  }
}
