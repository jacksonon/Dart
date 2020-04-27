import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappfishredux/list/item/state.dart';
import 'package:flutterappfishredux/store/state.dart';

class listState implements Cloneable<listState>, GlobalBaseState {

  List<ItemState> items; // 保存Item的state

  @override
  Color themeColor;

  @override
  listState clone() {
    return listState()
    ..items = items;
  }
}

listState initState(Map<String, dynamic> args) {
  return listState();
}
