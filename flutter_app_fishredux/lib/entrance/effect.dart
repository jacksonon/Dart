import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

// 页面初始化或异步请求这样的事件
// 接收并处理事件
Effect<EntranceState> buildEffect() {
  return combineEffects(<Object, Effect<EntranceState>>{
    EntranceAction.changeShowLabel: _onChangeShowLabel,
    EntranceAction.openGrid: _onOpenGrid,
  });
}

// 接收事件
void _onOpenGrid(Action action, Context<EntranceState> ctx) {
  Navigator.of(ctx.context).pushNamed('grid_page', arguments: null);
}

// 修改方法
void _onChangeShowLabel(Action action, Context<EntranceState> ctx) {
  ctx.state.showLabel = '你好';
}
