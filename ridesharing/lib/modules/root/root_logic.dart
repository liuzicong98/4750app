import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharing/modules/trip/trip_view.dart';
import 'package:ridesharing/service/app_service.dart';

import '../account/account_view.dart';
import '../message/message_view.dart';

class RootLogic extends GetxController {
  int tabIndex = 0;

  var    userid = Get.find<AppService>().userid.value;
  var pages = [

    TripPage(),
    AccountPage(),
  ];

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {

   print(userid);
    FirebaseDatabase.instance.ref("Profile/user" + userid).get().then((value) {

           Get.find<AppService>().name.value = value.child('name').value.toString();
           Get.find<AppService>().number.value=value.child('number').value.toString();
   });
  }

  RootLogic(){
    onInit();
    FirebaseDatabase.instance.ref("Profile/user" + userid).onChildChanged.listen((event) {
      onInit();
    });
  }
}
