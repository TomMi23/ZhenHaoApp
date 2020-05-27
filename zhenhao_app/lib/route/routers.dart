import 'package:app/route/router_handers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routers {
  static String root = "/";
  static String app = "/app";
  static String home = "/home";
  static String login = "/login";
  static String myPage = "/mypage";
  static String search="/search";


  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      print("handler not find");
    });

    router.define(root, handler: splashHandler);
    router.define(app, handler: mainHandler);
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(myPage, handler: myPageHandler);
    router.define(search, handler: searchPageHandler);
  }
}
