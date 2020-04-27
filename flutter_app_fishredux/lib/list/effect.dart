import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappfishredux/list/item/state.dart';
import 'action.dart';
import 'state.dart';

Effect<listState> buildEffect() {
  return combineEffects(<Object, Effect<listState>>{
    listAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<listState> ctx) {
}

void _onInit(Action action, Context<listState> ctx) {
  List<ItemState> mockData = [
    ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),
    ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),
    ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),
    ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),
    ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),
    ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),
    ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),
    ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),ItemState(
      type: 0,
      title: '我的标题',
      content: '的撒恢复较好副科级撒谎大富科技亏撒娇安徽的发卡机和',
    ),
  ];
  ctx.dispatch(listActionCreator.onInitList(mockData));
}