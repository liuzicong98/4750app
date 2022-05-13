import 'package:flutter/material.dart';

class ThemeUtils {
  // 默认主题色
  //static const Color defaultColor = const Color(0xFF4261FC);
  static const Color airCenterBg = const Color(0xFFF5F5F7);
  static const Color doorCenterBg = const Color(0xFFCDD5FF);
  static const Color loginPageBg = const Color(0xFFF7F8FA);
  static const Color defaultColor = Colors.blueAccent;
  static const Color itemTitle = const Color(0xFF9B9FA3);
  static const Color loading = const Color(0x009B9FA3);
  static const Color patrol_winbg = const Color(0xFF1e2432);

  // 可选的主题色
  static const List<Color> supportColors = [
    defaultColor,
    Colors.purple,
    Colors.orange,
    Colors.deepPurpleAccent,
    Colors.redAccent,
    Colors.blue,
    Colors.amber,
    Colors.green,
    Colors.lime,
    Colors.indigo,
    Colors.cyan,
    Colors.teal
  ];
}
