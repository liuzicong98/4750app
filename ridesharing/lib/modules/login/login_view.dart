import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/ThemeUtils.dart';
import '../../utils/toastUtils.dart';
import 'login_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginLogic logic = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[200],
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: 240.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('assets/images/login_head.png'),
                        fit: BoxFit.cover)),
                child: Align(
                  alignment: const Alignment(0, 0),
                  child: Text(
                    'Welcome to JoinCarpool',
                    style: TextStyle(
                      fontSize: 23.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: 310.w,
                height: 440.h,
                margin: EdgeInsets.only(top: 161.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: Container(
                  margin: EdgeInsets.only(top: 40.h, left: 31.w, right: 31.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w500),
                      ),
                      TextField(
                        maxLines: 1,
                        decoration: const InputDecoration(hintText: 'Email'),
                        onChanged: (email) {
                          logic.email.value = email;
                        },
                      ),
                      SizedBox(height: 40.h),
                      Text('Password',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w500)),
                      TextField(
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        decoration: const InputDecoration(hintText: 'Password'),
                        onChanged: (pwd) {
                          logic.pwd.value = pwd;
                        },
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: InkWell(
                          child: Text(
                            'Forget password?',
                            style: TextStyle(
                              color: Colors.blue
                            ),
                          ),
                            onTap:(){
                              FirebaseAuth.instance.sendPasswordResetEmail(email: logic.email.value)
                                  .then((value) {
                                ToastUtils.showToast("Successfully send an email!");

                              }).catchError((error) {
                                ToastUtils.showToast("Failed sent an email.");
                                print(error.toString());
                              });
                            }
                        ),
                      ),
                      Container(
                          height: 45.h,
                          width: 299.w,
                          margin: EdgeInsets.only(top: 40.h),
                          child: TextButton(
                              style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 17.sp,
                                )),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {

                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.blue[200];
                                  }

                                  return ThemeUtils.defaultColor;
                                }),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22))),
                              ),
                              onPressed: () {
                                logic.login();
                              },
                              child: const Text('Login'))),
                      Container(
                          height: 45.h,
                          width: 299.w,
                          margin: EdgeInsets.only(top: 20.h),
                          child: TextButton(
                              style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 17.sp,
                                )),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {

                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.blue[200];
                                  }

                                  return ThemeUtils.defaultColor;
                                }),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22))),
                              ),
                              onPressed: () {
                                Get.toNamed(Routes.SIGNUP);

                              },
                              child: const Text('Sign up'))),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }
}
