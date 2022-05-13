import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:ridesharing/http/response/base_response_entity.dart';

import '../../../http/dao/trip_dao.dart';
import '../../../http/response/trip.dart';
import '../../../http/response/trip_entity.dart';
import '../../../service/app_service.dart';
import '../../../utils/toastUtils.dart';

class HistoryLogic extends GetxController {
  final controller = EasyRefreshController().obs;
  final items = <Trip>[].obs;
  late final TripEntity user;

  Future<void> onLoad() async => {controller.value.finishLoad(noMore: true)};

  Future<void> onRefresh() async {
    // TripEntity tripEntity = await TripDao.getMyTrip();
    // if (tripEntity.code == 200) {
    //   items.clear();
    //   items.addAll(tripEntity.data!);
    //   ToastUtils.showToast('success');
    //   controller.value.finishRefresh(success: true);
    // } else {
    //   ToastUtils.showToast('fail');
    //   controller.value.finishRefresh(success: false);
    // }

    FirebaseDatabase.instance.ref("Trip").get().then((value) {
      print(Get.find<AppService>().userid.value);
      items.clear();
      var trips=<Trip>[];
      trips.clear();
      value.children.forEach((e) {
        print(json.encode(e.value));

        Trip trip = Trip.fromJsonMap(json.decode(json.encode(e.value)));

        if(trip.userid==Get.find<AppService>().userid.value) {
          trips.add(trip);

        }
        


      });
      items.addAll(trips);
      controller.value.finishRefresh(success: true);
      print(items.length);

    }).catchError((error){
      print(error);

    });
  }

  delete(Trip item) async {
    // BaseResponseEntity entity = await TripDao.del("${item.trip?.id!}");
    // if (entity.code == 200) {
    //   ToastUtils.showToast('Successfully deleted!');
    //   items.remove(item);
    //   update();
    // } else {
    //   ToastUtils.showToast('Failed to delete.');
    // }
    //FirebaseDatabase.instance.ref("Trip").child(path)
  }
}
