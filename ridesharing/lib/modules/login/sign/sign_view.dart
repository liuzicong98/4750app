import 'package:bruno/bruno.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/app_service.dart';
import '../../../utils/ThemeUtils.dart';
import '../../../utils/toastUtils.dart';
import 'sign_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignPage extends StatelessWidget {
  final logic = Get.put(SignLogic());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        brightness: Brightness.dark,
        backgroundColor: ThemeUtils.defaultColor,

        automaticallyImplyLeading: true,
        title: 'Sign up',
      ),
      body: Column(children: [
        BrnTextInputFormItem(
          //controller: logic.emailCtl.value,
          controller: emailController,
          title: "Email:",
          hint: "Please Enter",
          inputType: BrnInputType.email,
          isRequire: true,
        ),
        BrnTextInputFormItem(
          //controller: logic.pwdCtl.value,
          controller: passwordController,
          title: "Password:",
          hint: "Please Enter",
          inputType: BrnInputType.pwd,
          isRequire: true,
        ),
        BrnTextInputFormItem(
          controller: logic.nameCtl.value,
          title: "name:",
          hint: "Please Enter",
          isRequire: true,
        ),
        BrnTextInputFormItem(
          controller: logic.numCtl.value,
          title: "Number:",
          hint: "Please Enter",
          inputType: BrnInputType.number,
          isRequire: true,
        ),
        SizedBox(
          height: 40,
        ),
        BrnBigMainButton(
          title: 'Sign up',
          width: Get.width - 80,
          onTap: () {

            FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
                  .then((authResult) {
              ToastUtils.showToast("Successfully sign up the user!");

              var userProfile = {
              'uid' : authResult.user!.uid,
              'name' : logic.nameCtl.value.text,
              'email' : emailController.text,
              'number' : logic.numCtl.value.text,
              };

              FirebaseDatabase.instance.ref("Profile/user" + authResult.user!.uid)
              .set(userProfile)
              .then((value) {
                print("Successfully created profile");

              }).catchError((error) {
                print("Failed to create profile");
              });

              Navigator.pop(context);


                  }).catchError((error) {
              ToastUtils.showToast("Failed to sign up the user!");
              ToastUtils.showToast(error.toString());
            });


            


           // logic.sign();

          },
        )
      ]),
    );
  }
}
