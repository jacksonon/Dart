import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappfishredux/list/item/component.dart';
import 'package:flutterappfishredux/list/item/state.dart';
import 'state.dart';

class listAdapter extends DynamicFlowAdapter<listState> {
  listAdapter()
      : super(
          pool: <String, Component<Object>>{
            "MyItem": ItemComponent(), // 引用组件
          },
          connector: _listConnector(),
          );
}

class _listConnector extends ConnOp<listState, List<ItemBean>> {
  @override
  List<ItemBean> get(listState state) {
    if (state.items?.isNotEmpty == true) {
      // 把item数据转化成ItemBean的列表
      return state.items
          .map<ItemBean>((ItemState data) => ItemBean('MyItem', data))
          .toList(growable: true);
    } else {
      // 返回空列表
      return <ItemBean>[];
    }
  }

  @override
  void set(listState state, List<ItemBean> items) {
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
