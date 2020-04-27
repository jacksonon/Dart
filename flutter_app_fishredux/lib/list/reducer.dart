import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappfishredux/list/item/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<listState> buildReducer() {
  return asReducer(
    <Object, Reducer<listState>>{
      listAction.action: _onAction,
      listAction.initList: _onInitList,
    },
  );
}

listState _onAction(listState state, Action action) {
  final listState newState = state.clone();
  return newState;
}

listState _onInitList(listState state, Action action) {
  final List<ItemState> data = action.payload ?? <ItemState>[];
  final listState newState = state.clone();
  newState.items = data;
  return newState;
}
