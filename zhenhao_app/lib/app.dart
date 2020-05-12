import 'package:app/view/home/home_page.dart';
import 'package:app/view/login/login_page.dart';
import 'package:app/view/my/my_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base/page_provide_node.dart';
import 'main_provide.dart';



// ignore: must_be_immutable
class App extends PageProvideNode {

  App() {
//    mProviders.add(MainProvide.instance);
//    mProviders = MainProvide.instance;
  }
  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _AppContentPage();
  }
}

class _AppContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<_AppContentPage> with TickerProviderStateMixin<_AppContentPage> {

  MainProvide _provide;
  TabController controller;
  HomePage _home = HomePage();
  LoginPage _login = LoginPage();
  MyPage _myPage = MyPage();

  Animation<double> _animationMini;
  AnimationController _miniController;
  final _tranTween = new Tween<double>(begin: 1, end: 0);

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("首页");

    _provide = MainProvide.instance;

    controller = new TabController(length: 3, vsync: this);

    _miniController = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationMini = new CurvedAnimation(parent: _miniController, curve: Curves.linear);
  }

  @override
  void dispose() {
    super.dispose();
    print("app释放");
  }

  ontap(int index) {
    _provide.currentIndex = index;
    controller.animateTo(index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => _provide,
      child: new Scaffold(
          body: new Stack(
            alignment: AlignmentDirectional.bottomEnd,
            overflow: Overflow.visible,
            children: <Widget>[
              _initTabBarView()
            ],
          ),
          bottomNavigationBar: _initBottomNavigationBar()
      ),
    );
  }

  // TabBarView存在页面释放问题
//  Widget _initTabBarView() {
//    return new TabBarView(
//      controller: controller,
//      physics: NeverScrollableScrollPhysics(),
//      children: [
//        _home,
//        _old,
//        _mine,
//      ],
//    );
//  }

  Widget _initTabBarView() {
    return Consumer(
        builder : (BuildContext context, MainProvide mainProvider, Widget child) {
          return IndexedStack(
            index: _provide.currentIndex,
            children: <Widget>[
              _home,
              _login,
              _myPage
            ],
          );
        }
    );
  }


  Widget _initBottomNavigationBar() {
    return Theme(
        data: new ThemeData(
            canvasColor: Colors.white, // BottomNavigationBar背景色
            textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Colors.grey))
        ),
        child: Consumer(
            builder: (BuildContext context, MainProvide mainProvider, Widget child) {
              return BottomNavigationBar(
                  fixedColor: Colors.red,
                  currentIndex: mainProvider.currentIndex,
                  onTap: ontap,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    new BottomNavigationBarItem(
                        icon: new Icon(Icons.music_video),
                        title: new Text('首页')),
                    new BottomNavigationBarItem(
                        icon: new Icon(Icons.music_note),
                        title: new Text('推荐')),
                    new BottomNavigationBarItem(
                        icon: new Icon(Icons.people),
                        title: new Text('我的'))
                  ]);
            }
        )
    );
  }
}