import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;
import 'package:flutterappfishredux/store/state.dart';
import 'package:flutterappfishredux/store/store.dart';

import 'entrance/page.dart';
import 'grid/page.dart';
import 'list/page.dart';
/*
fish_redux 有一套自己的路由，有3种路由方式
AppRoutes 多个page共享一个store
PageRoutes 每个page有一个store
HybridRoutes 可以结合上面两种方式
 */

Widget createApp() {
  // 页面级别的路由，每个页面都有一个store
  // 抽象路由
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      // 添加页面
      'entrance_page': EntrancePage(),
      'grid_page': gridPage(),
      'list_page': listPage(),
    },
  );

  // 配置visttor关联各个页面state和GlobalState
  visitor:(String path, Page<Object, dynamic>page) {
    if (page.isTypeof<GlobalBaseState>()) {
      page.connectExtraStore<GlobalState>(
        GlobalStore.store, (Object pageState, GlobalState appState) {
          final GlobalBaseState p = pageState;
          if (p.themeColor != appState.themeColor) {
            if (pageState is Cloneable) {
              final Object copy = pageState.clone();
              final GlobalBaseState newState = copy;
              newState.themeColor = appState.themeColor;
              return newState;
            }
          }
          return pageState;
      }
      );
    }
  };

  return MaterialApp(
    title: 'fish_redux',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // 生成路由
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
    home: routes.buildPage('entrance_page', null), // 作为默认页面
  );
}