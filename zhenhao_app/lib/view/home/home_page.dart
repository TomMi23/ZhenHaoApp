import 'package:app/config/string.dart';
import 'package:app/main/dialog/dialog.dart';
import 'package:app/utils/navigator_util.dart';
import 'package:app/utils/toast_util.dart';
import 'package:app/view/home/entity/swiper_entity.dart';
import 'package:app/view/home/service/home_service.dart';
import 'package:app/view/widgets/Category_view.dart';
import 'package:app/view/widgets/groupbuy_view.dart';
import 'package:app/view/widgets/swiper_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
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
  HomeSwiperEntity _homeSwiperEntity;
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();

    _queryHomeData();
  }

  _queryHomeData() {

    _homeService.queryHomeData((success) {
      setState(() {
        _homeEntity = success;
        _controller.finishRefresh();
      });
    }, (error) {
      ToastUtil.showToast(error);
      _controller.finishRefresh();
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
                color: Colors.black,
              ),
              onPressed: () => NavigatorUtils.goSearchPage(context))
        ],
    ),
    body:contentWidget()
    );
  }

  //中间部分
  Widget contentWidget(){
    return _homeEntity == null ? LoadingDialog()
        : Container(
          child: EasyRefresh(
            controller: _controller,//控制器
            header: BezierCircleHeader(backgroundColor: Colors.deepOrange),
            footer: BezierBounceFooter(backgroundColor: Colors.deepOrange),
            enableControlFinishRefresh: true, // 是否开启控制结束刷新
            enableControlFinishLoad: false, // 是否开启控制结束加载
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //滚动图片
                  MySwiperView(_homeEntity.swipeAdvInfoList, _homeEntity.swipeAdvInfoList.length,
                      ScreenUtil().setHeight(360.0)),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  //九宫格
                  CategoryMenu(_homeEntity.channelInfoList),
                  Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Text(Strings.GROUP_BUG),
                  ),
                  GroupBuyView(_homeEntity.grouponBuyList),
                ],
              ),
            ),
          ),
    );

  }

}