import 'package:get/get.dart';
import 'package:ridesharing/http/response/login_response_entity.dart';
import 'package:ridesharing/service/app_service.dart';

class AccountLogic extends GetxController {
  late final LoginResponseData user;
  final number = ''.obs;
  final email = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // user = Get.find<AppService>().user.value;
    // number.value = user.number!;
    // email.value = user.email!;
  }
}
