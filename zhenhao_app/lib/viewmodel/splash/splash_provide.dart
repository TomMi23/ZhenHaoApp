import 'package:app/base/app_config.dart';
import 'package:app/base/page_provide_node.dart';

class SplashProvide extends BaseProvide {
  List<String> guideList = [
    'assets/images/guide_1.png',
    'assets/images/guide_2.png',
    'assets/images/guide_3.png',
    'assets/images/guide_4.png'
  ];

  bool _isGuide = false;
  bool get isGuide => AppConfig.appTools.getSplashData();
  set isGuide(bool flg) {
    AppConfig.appTools.setSplashData(flg);
    _isGuide = isGuide;
    notify();
  }

  notify() {
    notifyListeners();
  }



}