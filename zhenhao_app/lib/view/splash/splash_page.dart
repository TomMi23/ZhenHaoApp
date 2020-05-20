
import 'dart:async';

import 'package:app/base/app_config.dart';
import 'package:app/utils/navigator_util.dart';
import 'package:app/viewmodel/splash/splash_provide.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../app.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{


  SplashProvide _provide = SplashProvide();
  //保证线程安全将所有的订阅者都添加进去，然后再Activity onPause或者onDestroy时候统一取消订阅，避免造成内存泄漏
  final _subscriptions = CompositeSubscription();

  List<Widget> _bannerList = new List();
  Timer _timer;
  bool isShowGuidBanner=false; //是否显示引导图 Offstage组件 false显示，true隐藏
  bool isShowSplashBg=false;  //是否显示启动图 Offstage组件 false显示，true隐藏
  int _count = 3; // 倒计时秒数

  // 跳转主页
  void _goMain() {
    //跳转后不再返回
    NavigatorUtils.goMainPage(context);
//    Navigator.of(context).pushAndRemoveUntil(
//        new MaterialPageRoute(builder: (context) => new App()
//        ), (route) => route == null);
  }

  void _initAsync() async  {
    if(_provide.isGuide){
      setState(() {
        isShowSplashBg=false;
        isShowGuidBanner=true;
      });
      _initSplash();
    }else{
      setState(() {
        _provide.isGuide=true;//设置显示过引导页了
        isShowSplashBg=true;
        isShowGuidBanner=false;
      });
      _initGuideBanner();
    }
  }


  @override
  void initState() {
    super.initState();
    _initAsync();

  }

  @override
  void dispose() {
    super.dispose();
    _subscriptions.dispose();
  }

  // 构建闪屏背景
  Widget _buildSplashBg() {
    return new Image.asset(
      'assets/images/splash_default.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }

  _initSplash() {
    // 倒计时
    _timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        if (_count <= 1) {
          _timer.cancel();
          _timer = null;
          _goMain();
        } else {
          _count = _count - 1;
        }
      });
    });
  }


  // 构建引导页
  _initGuideBanner() {
    for (int i = 0, length = _provide.guideList.length; i < length; i++) {
      if (i == length - 1) {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _provide.guideList[i],
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child:new Container(
                    width: 200.0,
                    height: 40.0,
                    margin: EdgeInsets.only(bottom: 50.0),
                    child: new RaisedButton(onPressed: (){
                      _goMain();
                    },color: Colors.indigoAccent,
                      child: new Text("立即体验",style: TextStyle(color: Colors.white, fontSize: 16.0)),
                      shape: new StadiumBorder(side: new BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.transparent,
                      )),
                    ),
                  ),
            ),
          ],
        ));
      } else {
        // print(_guideList[i]);
        _bannerList.add(new Image.asset(
          _provide.guideList[i],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ));
      }
    }
  }

  Widget _initView(){
    return new Material(
      child: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: isShowSplashBg,
            child: _buildSplashBg(),
          ),
          new Offstage(
            offstage:  isShowGuidBanner,
            child: _bannerList.isEmpty
                ? new Container()
                : new Swiper(
                autoStart: false,
                circular: false,
                indicator: CircleSwiperIndicator(
                  radius: 4.0,
                  padding: EdgeInsets.only(bottom: 30.0),
                  itemColor: Colors.black26,
                ),
                children: _bannerList
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provide,
      child: Scaffold(
        body: _initView(),
      ),
    );
  }
}