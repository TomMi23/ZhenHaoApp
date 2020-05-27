import 'package:app/view/home/home_page.dart';
import 'package:app/view/login/login_page.dart';
import 'package:app/view/my/my_page.dart';
import 'package:app/view/search/search_page.dart';
import 'package:app/view/splash/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../app.dart';

//应用程序首页
var mainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return App();
    });
//首页
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return HomePage();
    });
//引导页
var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return SplashPage();
    });
//登录页
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return LoginPage();
    });
//我的页面
var myPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return MyPage();
    });
//搜索页
var searchPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return SearchPage();
    });

