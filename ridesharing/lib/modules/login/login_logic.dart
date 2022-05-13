import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ridesharing/service/app_service.dart';

import '../../http/dao/login_dao.dart';
import '../../http/response/login_response_entity.dart';
import '../../routes/app_pages.dart';
import '../../utils/toastUtils.dart';

class LoginLogic extends GetxController {
  var email = ''.obs;
  var pwd = ''.obs;


  login() async {
    if (email.value.isEmpty || pwd.value.isEmpty) {
      ToastUtils.showToast('email or password can not be empty');
      return;
    }

    FirebaseAuth.instance.signInWithEmailAndPassword(email: email.value, password: pwd.value)
    .then((value) {
      print(value.user!.uid);
      Get.find<AppService>().userid.value = value.user!.uid;
      Get.find<AppService>().email.value = email.value;

      ToastUtils.showToast('Successfully login!');
        Get.offAndToNamed(Routes.ROOT);

    }).catchError((error){
      ToastUtils.showToast('Invalid email or password');
    });
    // LoginResponseEntity response = await LoginDao.login(email.value, pwd.value);
    // printInfo(info: '${response.toJson()}');
    // if (response.code == 200) {
    //   ToastUtils.showToast('login success');
    //   Get.offAndToNamed(Routes.ROOT);
    // } else {
    //   ToastUtils.showToast('login fail');
    // }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Get.put(this);
  }
}
