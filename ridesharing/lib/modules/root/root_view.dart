import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/ThemeUtils.dart';
import 'root_logic.dart';

class RootPage extends StatelessWidget {
  DateTime? lastPopTime;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootLogic>(builder: (controller) {
      return Scaffold(
        body: WillPopScope(
          onWillPop: () => _willPop(context),
          child: IndexedStack(
            index: controller.tabIndex,
            children: controller.pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            // BottomNavigationBarItem(
            //     label: 'Message', icon: Icon(CupertinoIcons.mail_solid)),
            BottomNavigationBarItem(
                label: 'Trip', icon: Icon(CupertinoIcons.car)),
            BottomNavigationBarItem(
                label: 'Account', icon: Icon(Icons.account_circle)),
          ],

          selectedItemColor: ThemeUtils.defaultColor,

          unselectedItemColor: Colors.grey,
        ),
      );
    });
  }

  Future<bool> _willPop(BuildContext context) async {
    if (lastPopTime == null ||
        DateTime.now().difference(lastPopTime!) > const Duration(seconds: 1)) {
      lastPopTime = DateTime.now();

      BrnToast.show("One more press to exit.", context);
      return false;
    } else {
      lastPopTime = DateTime.now();

      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return true;
    }
  }
}
