import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  MyPage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyContentPage();
  }
}

class _MyContentPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),

    );
  }

}