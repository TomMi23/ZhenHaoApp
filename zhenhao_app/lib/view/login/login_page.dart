import 'package:app/base/app_config.dart';
import 'package:app/main/dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:app/viewmodel/login/login_provide.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginPage extends StatefulWidget {

  LoginPage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginContentPage();
  }
}

class _LoginContentPage extends State<LoginPage> {
  LoginProvide _provide = LoginProvide();
  //保证线程安全将所有的订阅者都添加进去，然后再Activity onPause或者onDestroy时候统一取消订阅，避免造成内存泄漏
  final _subscriptions = CompositeSubscription();

  final _loading = LoadingDialog();

  final _userTF = TextEditingController();
  final _emailTF = TextEditingController();
  final _pwdTF = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  @override
  void dispose() {
    super.dispose();
    print("login释放");
    _subscriptions.dispose();
  }


  Widget _initView() {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          _setupBack(),
          _setupTop(),
          _setupTextFields(),
          _setupLoginBtn(),
          _setupResetPwd(),
          _setupBottom(),
          new Container(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _setupBack() {
    print('_setupBack');
    return new Container(
      height: 160,
      padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: new GestureDetector(
        onTap: () {
          this._goback(false);
        },
        child: new Icon(
          Icons.keyboard_arrow_left,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }

  Widget _setupTop() {
    print('_setupTop');
    return new Column(
      children: <Widget>[
        new Text(
          '请输入你的用户名',
          style: TextStyle(fontSize: 23),
        ),
        new Text(
          '未注册的用户，登录后即可注册',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        new Container(
          height: 50,
        )
      ],
    );
  }

  _setupTextFields() {
    return new Column(
      children: _setupContent(),
    );
  }

  List<Container> _setupContent() {
    return new List<Container>.generate(3, (int index) => _setupItem(index));
  }

  Widget _setupItem(int index) {
    print('_setupItem');
    return new Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                width: 60,
                child: new Text(_provide.titles[index],
                    style: TextStyle(fontSize: 16)),
              ),
              Selector<LoginProvide, bool>(
                selector: (_, provide) => provide.passwordVisiable,
                builder: (_, value, child) {
                  return new Expanded(
                      child: TextField(
                          obscureText: (index == 2 && value == false) ? true : false,
                          style: new TextStyle(color: Colors.black),
                          controller: index == 0 ? _userTF:index == 1 ? _emailTF:_pwdTF,
                          decoration: InputDecoration(
                            hintText: _provide.placeHoderText[index],
                            hintStyle: new TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onChanged: (str) {
                            if (index == 0) {
                              _provide.userName = str;
                            }
                            if (index == 1) {
                              _provide.email = str;
                            }
                            if (index == 2) {
                              _provide.password = str;
                            }
                          })
                  );
                },
              ),

              index == 2 ? _setupEyeOpened() : new Container()
            ],
          ),
          new Divider(height: 1, color: AppConfig.divider)
        ],
      ),
    );
  }


  Widget _setupEyeOpened() {
    print('_setupEyeOpened');
    return Selector<LoginProvide, bool>(
      selector: (_, provide) => provide.passwordVisiable,
      builder: (_, value, child) {
        return new GestureDetector(
          onTap: () {
            print(value);
            _provide.passwordVisiable =
            !_provide.passwordVisiable;
          },
          child: new Icon(
            value
                ? Icons.remove_red_eye
                : Icons.panorama_fish_eye,
            color: Colors.black,
          ),
        );
      },
    );
  }

  Widget _setupLoginBtn() {
    print('_setupLoginBtn');
    return Selector<LoginProvide, bool>(
      selector: (_, provide) => provide.loginEnable,
      builder: (_, value, child) {
        return new Container(
          height: 48,
          width: MediaQuery.of(context).size.width - 60,
          margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
          child: new RaisedButton(
            disabledColor: AppConfig.disabledMainColor,
            color: AppConfig.primaryColor,
            onPressed: value ? _login : null,
            child: new Text('登 录', style: new TextStyle(color: Colors.white, fontSize: 18)),
          ),
        );
      },
    );
  }

  Widget _setupResetPwd() {
    print('_setupResetPwd');
    return new Container(
      padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
      child: new Row(
        children: <Widget>[
          new Text('忘记密码？', style: TextStyle(fontSize: 14, color: Colors.grey)),
          new GestureDetector(
            onTap: () {
              this._resetPwd();
            },
            child: new Text('重置密码',
                style: TextStyle(fontSize: 14, color: AppConfig.primaryColor)),
          )
        ],
      ),
    );
  }

  Widget _setupBottom() {
    print('bottom-refresh');
    return Selector<LoginProvide, bool>(
      selector: (_, provide) => provide.agreeProtocol,
      builder: (_, value, child) {
        return new Container(
            height: MediaQuery.of(context).size.height - 560,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    _provide.agreeProtocol = !_provide.agreeProtocol;
                  },
                  child: value
                      ? new Icon(
                    Icons.check_circle,
                    color: AppConfig.primaryColor,
                  )
                      : new Icon(
                    Icons.check_circle_outline,
                    color: AppConfig.grayTextColor,
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    _provide.agreeProtocol = !_provide.agreeProtocol;
                  },
                  child: new Text('已认真阅读并同意',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                new GestureDetector(
                  onTap: _gotoRegiestProticol,
                  child: new Text('《注册协议》',
                      style:
                      TextStyle(fontSize: 14, color: AppConfig.primaryColor)),
                )
              ],
            ));
      },
    );
  }

  _login() {
    if (_provide.agreeProtocol == false) {
      Fluttertoast.showToast(msg: "尚未同意注册协议", gravity: ToastGravity.CENTER);
      return;
    }
    var s = _provide
        .login()
        .doOnListen(() {
      _loading.show(context);
    })
        .doOnCancel(() {})
        .listen((data) {
          _loading.hide(context);
          if (data.success) {
            var res = data.data as Map;

            /// 存储用户信息
            AppConfig.userTools.setUserData(res).then((success) {
              if (success) {
                Fluttertoast.showToast(
                    msg: "登录成功", gravity: ToastGravity.CENTER);
                Future.delayed(Duration(seconds: 1), () {
                  this._goback(true);
                });
              }
            });
          }
        }, onError: (e) {
          _loading.hide(context);
        });
    _subscriptions.add(s);
  }

  _agree() {
    _provide.agreeProtocol = !_provide.agreeProtocol;
  }

  _gotoRegiestProticol() {
    print("去注册页面");
//    Navigator.push(
//        context, MaterialPageRoute(builder: (_) => RegiestProtocolPage()))
//        .then((value) {});
  }

  _resetPwd() {
    print("去忘记密码页面");
//    Navigator.push(
//        context, MaterialPageRoute(builder: (_) => ResetPasswordPage()))
//        .then((value) {});
  }

  _goback(bool logined) {
    Navigator.pop(context, logined);
  }
}
