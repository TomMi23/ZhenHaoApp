import 'package:app/utils/navigator_util.dart';
import 'package:app/utils/toast_util.dart';
import 'package:app/view/home/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'entity/home_entity.dart';

class HomePage extends StatefulWidget {

  HomePage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeContentPage();
  }
}

class _HomeContentPage extends State<HomePage> {
  HomeService _homeService = HomeService();
  HomeEntity _homeEntity;
  @override
  void initState() {
    super.initState();

    _queryHomeData();
  }

  _queryHomeData() {
    _homeService.queryHomeData((success) {
      setState(() {
        _homeEntity = success;
        print(_homeEntity);
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("甄好"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () => NavigatorUtils.goSearchPage(context))
        ],
    ),

    );
  }

}