
import 'dart:ui';

import 'package:app/tools/app_tools.dart';
import 'package:app/tools/user_tool.dart';

class AppConfig {
  static const baseUrl = 'http://chenliang.yishouhaoge.cn/';

  static const backgroundColor = Color(0xFFF5F5F8);
  static const primaryColor = Color(0xFF5DBE82); //主题色
  static const grayTextColor = Color(0xFF71747E);
  static const disabledMainColor = Color.fromRGBO(97, 190, 130, 0.5);
  static const divider = Color(0xFFdddddd);

  static UserTools userTools;
  static AppTools appTools;

  static init() async {
    userTools = await UserTools.getInstance();
    appTools = await AppTools.getInstance();
  }

}