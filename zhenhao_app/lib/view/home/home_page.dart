import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  HomePage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeContentPage();
  }
}

class _HomeContentPage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
    ),

    );
  }

}