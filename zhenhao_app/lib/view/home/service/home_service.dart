import 'package:app/api/api.dart';
import 'package:app/config/string.dart';
import 'package:app/utils/httpUtil.dart';
import 'package:app/base/base.dart';
import 'package:app/view/home/entity/home_entity.dart';

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
}