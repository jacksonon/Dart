import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import '../api.dart';

Reducer<gridState> buildReducer() {
  return asReducer(
    <Object, Reducer<gridState>>{
      gridAction.action: _onAction,
      gridAction.loadData: _onLoadData, // 接收loadData action
    },
  );
}

gridState _onAction(gridState state, Action action) {
  final gridState newState = state.clone();
  return newState;
}

gridState _onLoadData(gridState state, Action action) {
  final gridState newState = state.clone()..models = Api().getGridData();
  return newState;
}
