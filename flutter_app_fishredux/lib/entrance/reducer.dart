import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

// 页面点击修改主题等
Reducer<EntranceState> buildReducer() {
  return asReducer(
    <Object, Reducer<EntranceState>>{
//      EntranceAction.changeShowLabel: _onChangeShowLabel
    },
  );
}

//EntranceState _onChangeShowLabel(EntranceState state, Action action) {
//  print('映射到这个方法');
//  return state.clone()..showLabel = '呵呵呵';
//}