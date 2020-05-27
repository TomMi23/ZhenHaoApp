import 'package:app/config/application.dart';
import 'package:app/route/routers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';


class NavigatorUtils {
  static goMainPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.app,
        transition: TransitionType.inFromRight, replace: true);
  }

  static goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routers.home,
        transition: TransitionType.inFromRight, replace: true);
  }

  static goLogin(BuildContext context) {
    Application.router.navigateTo(context, Routers.login,
        transition: TransitionType.inFromRight);
  }

  static goMyPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.myPage,
        transition: TransitionType.inFromRight);
  }
  static goSearchPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.search,
        transition: TransitionType.inFromRight);
  }


}
