import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {

  SearchPage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
      ),

    );
  }

}