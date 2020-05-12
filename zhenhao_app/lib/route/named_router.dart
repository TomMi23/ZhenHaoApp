
import 'package:app/view/home/home_page.dart';
import 'package:app/view/login/login_page.dart';
import 'package:app/view/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import '../main.dart';

class NamedRouter {
  static Map<String, WidgetBuilder> routes;
//初始化App
  static Widget initApp() {
    return MaterialApp(
      initialRoute: '/',
      routes: NamedRouter.initRoutes(),
    );
  }

  //初始化路由
  static initRoutes() {
    routes = {
      '/': (context) => SplashPage(),
      '/home': (context) => App(),
      '/splashPage': (context) => SplashPage(),
      '/homePage': (context) => HomePage(),
      '/loginPage': (context) => LoginPage(),
    };
    return routes;
  }

}