import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharing/http/dao/login_dao.dart';
import 'package:ridesharing/http/response/base_response_entity.dart';
import 'package:ridesharing/utils/toastUtils.dart';

class SignLogic extends GetxController {
  final emailCtl = TextEditingController().obs;
  final pwdCtl = TextEditingController().obs;
  final numCtl = TextEditingController().obs;
  final nameCtl = TextEditingController().obs;

  void sign() async {
    BaseResponseEntity entity = await LoginDao.sign(emailCtl.value.text,
        pwdCtl.value.text, nameCtl.value.text, numCtl.value.text);
    if (entity.code == 200) {
      ToastUtils.showToast('success');
      Get.back();
    } else {
      ToastUtils.showToast('sign up fail');
    }
  }
}
