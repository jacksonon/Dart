import 'package:fish_redux/fish_redux.dart';

// 代表一个界面
// 继承自component
// 使用FlutterRedexPlugin可以快速常见redux开发模板

import 'effect.dart'; // 处理副作用，负责state更新之外的事情
import 'reducer.dart'; // 接收action， 然后对数据做出修改，即更新状态(state)
import 'state.dart'; // 保存页面的状态，即存放数据；
import 'view.dart'; // 绘制的基本组件

//
class EntrancePage extends Page<EntranceState, Map<String, dynamic>> {
  EntrancePage()
      : super(
            // 这是三要素
            initState: initState, // 初始化数据存储位置
            effect: buildEffect(), // 初始化除state更新之外的其它事情
            view: buildView, // 基础页面
//            reducer: buildReducer(), // 更新state
//            dependencies: Dependencies<EntranceState>( // 未知
//                adapter: null,
//                slots: <String, Dependent<EntranceState>>{
//                }),
//            middleware: <Middleware<EntranceState>>[ // 页面私有AOP。如果需要
//            ],
  );

}
