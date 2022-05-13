import 'package:bruno/bruno.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharing/service/app_service.dart';

import '../../../utils/ThemeUtils.dart';
import '../../../utils/toastUtils.dart';
import 'profile_logic.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.put(ProfileLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        brightness: Brightness.dark,
        backgroundColor: ThemeUtils.defaultColor,
        //默认显示返回按钮
        automaticallyImplyLeading: true,
        title: 'Profile',
      ),
      body: Column(children: [

        BrnTextInputFormItem(
          controller: logic.nameCtl.value
             ..text = Get.find<AppService>().name.value,
          title: "Name:",
          hint: "Please Enter",
          inputType: BrnInputType.text,
          isRequire: true,
        ),
        BrnTextInputFormItem(
          controller: logic.emailCtl.value
            ..text = Get.find<AppService>().email.value,
          title: "Email:",
          hint: "Please Enter",
          inputType: BrnInputType.email,
          isEdit: false,
          isRequire: true,
        ),

        BrnTextInputFormItem(
          controller: logic.numCtl.value
    ..text = Get.find<AppService>().number.value,
          title: "Number:",
          hint: "Please Enter",
          inputType: BrnInputType.number,
          isRequire: true,
        ),
        const SizedBox(
          height: 40,
        ),
        BrnBigMainButton(
          title: 'Submit',
          width: Get.width - 80,
          onTap: () {
            //logic.submit();
            FirebaseDatabase.instance.ref("Profile/user" + Get.find<AppService>().userid.value).update({
              'name': logic.nameCtl.value.text,
              'number': logic.numCtl.value.text,
            }).then((value){
              print("successfully edited!");
              ToastUtils.showToast('Successfully edited!');
              Get.back();
            }).catchError((error){
              print("Failed to edit");
              print(error);
            });
          },
        ),

        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: InkWell(
              child: Text(
                'Reset password',
                style: TextStyle(
                    color: Colors.blue
                ),
              ),
              onTap:(){
                FirebaseAuth.instance.sendPasswordResetEmail(email: Get.find<AppService>().email.value)
                    .then((value) {
                  ToastUtils.showToast("Successfully send an email!");

                }).catchError((error) {
                  ToastUtils.showToast("Failed sent an email.");
                  print(error.toString());
                });
              }
          ),
        )
      ]),
    );
  }
}
