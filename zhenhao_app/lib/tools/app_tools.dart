import 'package:app/base/const_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class AppTools {
  static String SEARCH_HISTORY_LIST = '_searchHistory_';

  static AppTools _instance;
  static Future<AppTools> get instance async {
    return await getInstance();
  }
  static Future<AppTools> getInstance() async  {
    if (_instance == null) {
      _instance = new AppTools();
      await _instance._init();

    }
    return _instance;
  }
  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }
  static SharedPreferences _spf;

  static bool _beforCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  /// 存储搜索关键字
  Future<bool> setSearchKey(String key) {
    if (_beforCheck()) return null;
    var list = this.getHistoryKeys();
    if (list.contains(key)) {
      list.remove(key);
      list.insert(0, key);
    } else {
      list.insert(0, key);
    }
    return _spf.setStringList(ConstConfig.SEARCH_HISTORY_LIST, list);
  }
  /// 获取搜索历史
  List<String> getHistoryKeys() {
    var list = _spf.getStringList(ConstConfig.SEARCH_HISTORY_LIST);
    if (list != null) {
      return list;
    } else {
      return [];
    }
  }

  /// 清空搜索历史
  Future<bool> delectSearchKey() {
    return _spf.setStringList(ConstConfig.SEARCH_HISTORY_LIST, []);
  }

  // 存储Splash数据
  Future<bool> setSplashData(isGuide) {
    return _spf.setBool(ConstConfig.KEY_GUIDE, isGuide);
  }

  // 获取Splash数据
  bool getSplashData() {
    var mapStr = _spf.getBool(ConstConfig.KEY_GUIDE) ?? false;
    return mapStr;
  }

}