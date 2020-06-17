import 'package:app/view/home/entity/home_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'cached_image.dart';

class CategoryMenu extends StatelessWidget {
  List<ChannelInfoList> categoryList;

  CategoryMenu(this.categoryList);

  _goCategoryView(BuildContext context, ChannelInfoList channel) {
//    NavigatorUtils.goCategoryGoodsListPage(
//        context, channel.name, channel.channelID);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            //  return _getGridViewItem(categoryList[index]);
            return _getGridViewItem(context, categoryList[index]);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //单个子Widget的水平最大宽度
            crossAxisCount: 5,
            //水平单个子Widget之间间距
            mainAxisSpacing: ScreenUtil().setWidth(20.0),
            //垂直单个子Widget之间间距
            crossAxisSpacing: ScreenUtil().setWidth(20.0),
          ),
        ));
  }

  Widget _getGridViewItem(BuildContext context, ChannelInfoList channel) {
    return Center(
      child: InkWell(
        onTap: () => _goCategoryView(context, channel),
        child: Column(
          children: <Widget>[
            CachedImageView(ScreenUtil().setWidth(60.0),
                ScreenUtil().setWidth(60.0), channel.iconUrl),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(10.0)),
            ),
            Text(
              channel.name,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(26.0),
                  color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
