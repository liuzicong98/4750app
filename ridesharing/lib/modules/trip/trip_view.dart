import 'package:bruno/bruno.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:ridesharing/service/app_service.dart';
import 'package:ridesharing/utils/ThemeUtils.dart';
import 'package:uuid/uuid.dart';

import '../../utils/toastUtils.dart';
import '../../widgets/trip_list_widget.dart';
import 'trip_logic.dart';

class TripPage extends StatelessWidget {
  final logic = Get.put(TripLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        brightness: Brightness.dark,
        backgroundColor: ThemeUtils.defaultColor,
        //默认显示返回按钮
        automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 44,
          padding: const EdgeInsets.only(left: 24, right: 12),
          child: ListView.separated(
            itemCount: 2,
            //横滑
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onTap: () {
                  logic.currentIndex.value = index;
                  logic.onRefresh();
                },
                child: Center(
                  child: Obx(() {
                    return Text(
                      index == 0 ? 'Passenger' : 'Driver',
                      style: logic.currentIndex.value == index
                          ? const TextStyle(color: Colors.white)
                          : const TextStyle(color: Colors.grey),
                    );
                  }),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 24,
              );
            },
          ),
        ),
        //自定义的右侧文本
        actions: BrnIconAction(
          child: const Icon(CupertinoIcons.add),
          iconPressed: () {
            showDialog<void>(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext dialogContext) {
                return _getDialog();
              },
            );
          },
        ),
      ),
      body: Obx(() {
        return EasyRefresh.custom(
          controller: logic.controller.value,
          enableControlFinishRefresh: true,
          enableControlFinishLoad: false,
          header: BallPulseHeader(),
          footer: BallPulseFooter(),
          firstRefresh: true,
          firstRefreshWidget: Center(
              child: LoadingFlipping.square(
            borderColor: Colors.cyan,
            size: 30.0,
          )),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return TripListItemWidget(logic.items[index], () {
                    // logic.join(logic.items[index]);
                  });
                },
                childCount: logic.items.length,
              ),
            ),
          ],
          onRefresh: logic.onRefresh,
          onLoad: logic.onLoad,
        );
      }),
    );
  }

  Widget _getDialog() {
    return BrnDialog(
      titleText: 'Post a trip',
      contentWidget: Column(
        children: [
          BrnTextInputFormItem(
            controller: logic.nameController.value
             ..text = Get.find<AppService>().name.value,
            isEdit: false,
            hint: "Please Enter",
            title: "Name:",
          ),
          BrnTextInputFormItem(
            controller: logic.startController.value,
            hint: "Please Enter",
            title: "Start:",
          ),
          BrnTextInputFormItem(
            controller: logic.endController.value,
            hint: "Please Enter",
            title: "End:",
          ),
          BrnTextInputFormItem(
            controller: logic.dataController.value,
            hint: "Please Enter",
            title: "Date:",
          ),
          Visibility(
            visible: logic.currentIndex.value == 1,
            child: BrnTextInputFormItem(
              controller: logic.modelController.value,
              hint: "Please Enter",
              title: "Model:",
            ),
          ),
          BrnTextInputFormItem(
            controller: logic.seatController.value,
            hint: "Please Enter",
            title: logic.currentIndex.value == 0
                ? "Require Seat:"
                : "Avaliable Seat:",
          ),
          BrnTextInputFormItem(
            controller: logic.numController.value,
            hint: "Please Enter",
            title: "Number:",
          ),
          BrnBigMainButton(
            width: 160,
            title: 'add',
            onTap: () {
              // FirebaseFirestore.instance.collection("Trip").add({
              FirebaseDatabase.instance.ref("Trip/trip" + Uuid().v1() ).set({
                "name": Get.find<AppService>().name.value,
                "start": logic.startController.value.text,
                "end": logic.endController.value.text,
                "date": logic.dataController.value.text,
                "model": logic.modelController.value.text,
                "seat": logic.seatController.value.text,
                "number": Get.find<AppService>().number.value,
                "type": "${logic.currentIndex.value}",
                "userid":Get.find<AppService>().userid.value,
                "tripid":Uuid().v1()

              }).then((value){
                print("successfully added a trip!");
                ToastUtils.showToast('Successfully added a trip!');
                Get.back();
              }).catchError((error){
                print("Failed to add a trip!");
                print(error);
              });

              //logic.addTrip();
            },
          ),
        ],
      ),
    );
  }
}
