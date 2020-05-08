
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';



abstract class PageProvideNode extends StatelessWidget {
  /// The values made available to the [child].
  BaseProvide mProviders = BaseProvide();

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseProvide>.value(
      value: mProviders,
      child: buildContent(context),
    );
  }
}

/// BaseProvide
class BaseProvide with ChangeNotifier {

  CompositeSubscription compositeSubscription = CompositeSubscription();


  /// add [StreamSubscription] to [compositeSubscription]
  ///
  /// 在 [dispose]的时候能进行取消
  addSubscription(StreamSubscription subscription){
    compositeSubscription.add(subscription);
  }

  @override
  void dispose() {
    super.dispose();
    compositeSubscription.dispose();
  }
}