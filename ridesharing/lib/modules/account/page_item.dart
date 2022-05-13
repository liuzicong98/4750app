import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ridesharing/routes/app_pages.dart';

import '../../res/style/behavior/no_scroll_behavior.dart';
import '../../utils/ThemeUtils.dart';



class MePageItem extends StatelessWidget {
  final Color color;

  MePageItem({this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return _buildChild(context);
  }

  Widget _buildChild(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollBehavior(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          _buildItem(context, Icons.restore, 'History', onTap: () {
            Get.toNamed(Routes.HISTORYPAGE);
          }),
          const Divider(
            height: 1,
          ),
          _buildItem(context, Icons.account_circle_sharp, 'Profile', onTap: () {
            Get.toNamed(Routes.PROFILE);
          }),
          const SizedBox(
            height: 200,
          ),
          Container(
              height: 45.h,
              width: 200.w,
              margin: EdgeInsets.only(top: 40.h, right: 40.h, left: 40.h),
              child: TextButton(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 17.sp,
                    )),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {

                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue[200];
                      }

                      return ThemeUtils.defaultColor;
                    }),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22))),
                  ),
                  onPressed: () {
                    Get.offAllNamed('/login');
                  },
                  child: const Text('Login out')))
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String title,
          {required VoidCallback onTap}) =>
      ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(title),
        trailing:
            Icon(Icons.chevron_right, color: Theme.of(context).primaryColor),
        onTap: onTap,
      );
}
