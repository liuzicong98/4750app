import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:ridesharing/http/dao/message_dao.dart';
import 'package:ridesharing/service/app_service.dart';

import '../../http/response/trip_entity.dart';
import '../../utils/toastUtils.dart';

class MessageLogic extends GetxController {
  final controller = EasyRefreshController().obs;
  final items = <TripData>[].obs;

  Future<void> onLoad() async => {controller.value.finishLoad(noMore: true)};

  Future<void> onRefresh() async {
    // int userid = Get.find<AppService>().user.value.id!;
    // TripEntity tripEntity = await MessageDao.getAllMessage("$userid");
    // if (tripEntity.code == 200) {
    //   items.clear();
    //   items.addAll(tripEntity.data!);
    //   ToastUtils.showToast('success');
    //   controller.value.finishRefresh(success: true);
    // } else {
    //   ToastUtils.showToast('fail');
    //   controller.value.finishRefresh(success: false);
    // }
  }
}
