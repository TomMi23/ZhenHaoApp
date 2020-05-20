import 'package:app/view/home/home_page.dart';
import 'package:app/view/login/login_page.dart';
import 'package:app/view/my/my_page.dart';
import 'package:app/view/splash/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../app.dart';

var mainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return App();
    });

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return HomePage();
    });

var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return SplashPage();
    });

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return LoginPage();
    });

var myPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return MyPage();
    });

