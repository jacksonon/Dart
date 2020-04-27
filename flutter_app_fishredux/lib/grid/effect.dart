import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<gridState> buildEffect() {
  return combineEffects(<Object, Effect<gridState>>{
    Lifecycle.initState: _init, // 页面初始化
    gridAction.action: _onAction,
    gridAction.onOpenList: _onOpenList, // 打开下一页面
  });
}

void _onAction(Action action, Context<gridState> ctx) {
}

void _onOpenList(Action action, Context<gridState> ctx) {
  Navigator.of(ctx.context).pushNamed('list_page', arguments: null);
}

void _init(Action action, Context<gridState> ctx) {
  ctx.dispatch(gridActionCreator.onLoadData()); // 初始化时候发送事件
}

