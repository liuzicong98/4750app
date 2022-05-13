import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:ridesharing/http/dao/trip_dao.dart';
import 'package:ridesharing/http/response/base_response_entity.dart';
import 'package:ridesharing/service/app_service.dart';

import '../../http/response/trip.dart';
import '../../utils/toastUtils.dart';
import 'dart:convert';

class TripLogic extends GetxController {
  final controller = EasyRefreshController().obs;
  final items = <Trip>[].obs;
  final nameController = TextEditingController().obs;
  final startController = TextEditingController().obs;
  final endController = TextEditingController().obs;
  final seatController = TextEditingController().obs;
  final dataController = TextEditingController().obs;
  final numController = TextEditingController().obs;
  final modelController = TextEditingController().obs;

  RxInt currentIndex = 0.obs;

  Future<void> onLoad() async => {controller.value.finishLoad(noMore: true)};

  TripLogic(){
      onRefresh();
      FirebaseDatabase.instance.ref("Trip").onChildChanged.listen((event) {
        onRefresh();
      });
      FirebaseDatabase.instance.ref("Trip").onChildRemoved.listen((event) {
        onRefresh();
      });

  }
  Future<void> onRefresh()  async {
    // TripEntity tripEntity = await TripDao.getTrip(currentIndex.value);
    // if (tripEntity.code == 200) {
    //   items.clear();
    //   items.addAll(tripEntity.data!);
    //   ToastUtils.showToast('success');
    //   controller.value.finishRefresh(success: true);
    // } else {
    //   ToastUtils.showToast('fail');
    //   controller.value.finishRefresh(success: false);
    // }

    // }


      FirebaseDatabase.instance.ref("Trip").get().then((value) {
      items.clear();
      var trips=<Trip>[];
      trips.clear();
      value.children.forEach((e) {
      print(json.encode(e.value));

       Trip trip = Trip.fromJsonMap(json.decode(json.encode(e.value)));

       if(int.parse(trip.type)==currentIndex.value) {
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

  void addTrip() async {
    var name = nameController.value.text;
    var start = startController.value.text;
    var end = endController.value.text;
    var date = dataController.value.text;
    var model = modelController.value.text;
    var seat = seatController.value.text;
    var number = numController.value.text;
    var type = currentIndex.value;
    BaseResponseEntity entity = await TripDao.addTrip(
        name, start, end, date, model, seat, number, type);
    if (entity.code == 200) {
      ToastUtils.showToast("success");
      nameController.value.clear();
      nameController.value.clear();
      startController.value.clear();
      endController.value.clear();
      dataController.value.clear();
      modelController.value.clear();
      seatController.value.clear();
      numController.value.clear();

      onRefresh();
      Get.back();
    } else {
      ToastUtils.showToast('fail');
    }
  }

  void join(Trip item) async {
    // int tripid = item.trip!.id!;
    // int userid = Get.find<AppService>().user.value.id!;
    // if (item.user!.id! == userid) {
    //   ToastUtils.showToast('can not join self');
    //   return;
    // }
    // BaseResponseEntity entity = await TripDao.join(tripid, userid);
    // if (entity.code == 200) {
    //   ToastUtils.showToast('join success');
    // } else {
    //   ToastUtils.showToast('fail');

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
