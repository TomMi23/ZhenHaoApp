import 'package:app/api/api.dart';
import 'package:app/config/string.dart';
import 'package:app/utils/httpUtil.dart';
import 'package:app/base/base.dart';
import 'package:app/view/home/entity/home_entity.dart';
import 'package:app/view/home/entity/swiper_entity.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnFail(String message);

typedef OnSuccess<T>(T successData);

class HomeService {
  Future queryHomeData(OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(Api.HOME_URL);
      if (response['returnCode'] == "TS0000" ||response['returnMsg']=="SUCCESS" ) {
        HomeEntity homeEntity = HomeEntity.fromJson(response['returnData']);
        onSuccess(homeEntity);
      } else {
        onFail(response['returnMsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
  //获取首页Swiper数据
  Future queryHomeSwiperData(OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(Api.HOME_SWIPERURL);
      if (response['returnCode'] == "TS0000" ||response['returnMsg']=="SUCCESS" ) {
        HomeSwiperEntity homeSwiperEntityEntity = HomeSwiperEntity.fromJson(response['returnData']);
        onSuccess(homeSwiperEntityEntity);
      } else {
        onFail(response['returnMsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}