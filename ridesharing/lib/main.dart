import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ridesharing/routes/app_pages.dart';
import 'package:ridesharing/service/app_service.dart';
import 'package:ridesharing/utils/ThemeUtils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initServices();
  // initFireMessage();
  // FirebaseMessaging.instance.getToken().then((value) {
  //   print('token===' + value!);
  // });
  runApp(const MyApp());
}
//
// void initFireMessage() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
// }

void initServices() async {
  print('starting services ...');


  Get.put(AppService());

  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (GetPlatform.isAndroid) {

      SystemUiOverlayStyle _style =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context) => GetMaterialApp(
        theme: ThemeData(backgroundColor: ThemeUtils.defaultColor),
        initialRoute: Routes.SPLASH,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
