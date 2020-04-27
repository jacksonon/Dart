import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappfishredux/store/state.dart';
import '../model.dart';

class gridState implements Cloneable<gridState>, GlobalBaseState {

  List<GridModel> models; // 存放数据

  @override
  Color themeColor;

  @override
  gridState clone() {
    return gridState()
        ..models = models; // clone规则
  }
}

gridState initState(Map<String, dynamic> args) {
  return gridState();
}
