import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ridesharing/http/request/sign_request.dart';
import 'package:ridesharing/http/request/updata_user_request.dart';
import 'package:ridesharing/http/response/base_response_entity.dart';

import '../../service/app_service.dart';
import '../../utils/toastUtils.dart';
import '../request/base_request.dart';
import '../request/login_request.dart';
import '../response/login_response_entity.dart';

class LoginDao {
  static login(String email, String password) {
    return _send(email, password);
  }

  static _send(String email, String password) async {
    // BaseRequest request = LoginRequest();
    // request.add("email", email).add("password", password);
    //
    // BrnLoadingDialog.show(Get.context!, content: 'login');
    // var result = await Dio().post(request.url(), data: request.params);
    // LoginResponseEntity response = LoginResponseEntity.fromJson(result.data);
    //
    // BrnLoadingDialog.dismiss(Get.context!);
    // if (response.code == 200) {
    //   Get.find<AppService>().user.value = response.data!;
    // } else {
    //   ToastUtils.showToast('fail');
    // }
    // return response;
  }

  static sign(String email, String password, String name, String number) async {
    BaseRequest request = SignRequest();
    request
        .add("email", email)
        .add("password", password)
        .add('username', name)
        .add('number', number);

    BrnLoadingDialog.show(Get.context!, content: 'sign');
    var result = await Dio().post(request.url(), data: request.params);
    BaseResponseEntity responseEntity =
        BaseResponseEntity.fromJson(result.data);

    BrnLoadingDialog.dismiss(Get.context!);

    return responseEntity;
  }

  static updata(int id, String username, String password, String email,
      String number) async {
    BaseRequest request = UpdataUserRequest();
    request
        .add('id', id)
        .add('username', username)
        .add('password', password)
        .add('email', email)
        .add('number', number);

    BrnLoadingDialog.show(Get.context!, content: 'updata');
    var result = await Dio().post(request.url(), data: request.params);
    BaseResponseEntity responseEntity =
        BaseResponseEntity.fromJson(result.data);

    BrnLoadingDialog.dismiss(Get.context!);

    return responseEntity;
  }
}
