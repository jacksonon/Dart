import 'package:fish_redux/fish_redux.dart' hide ListAdapter;
import 'package:flutterappfishredux/list/adapter.dart';

// 使用的事自定义的listAdapter 不是Fish-redux自带的listAdapter类，所以先处理引用


import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class listPage extends Page<listState, Map<String, dynamic>> {
  listPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<listState>(
              // + 为重载符，后指示我们自定义的adapter,外层不需要connector，所以前面传入一个Noneconn
                adapter: NoneConn<listState>() + listAdapter(),
                slots: <String, Dependent<listState>>{
                }),
            middleware: <Middleware<listState>>[
            ],);

}
