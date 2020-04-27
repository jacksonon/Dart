import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappfishredux/store/state.dart';

// clone方法，用来获取state,在reducer用会用到来merge state合并状态
class EntranceState implements Cloneable<EntranceState>, GlobalBaseState {

  // 定义一些用到的数据
  String showLabel = '跳转';
  int counter = 10;

  @override
  Color themeColor;

  @override
  EntranceState clone() {
    return EntranceState()
      ..showLabel = showLabel
      ..counter = counter;
  }
}

EntranceState initState(Map<String, dynamic> args) {
  final EntranceState state = EntranceState();
  return state;
}
