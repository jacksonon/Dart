import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutterappfishredux/list/adapter.dart';

import 'action.dart';
import 'state.dart';
//import 'adapter.dart';

Widget buildView(listState state, Dispatch dispatch, ViewService viewService) {

  ListAdapter adapter = viewService.buildAdapter();

  return Scaffold(
    appBar: AppBar(
      title: Text('列表页'),
      backgroundColor: state.themeColor,
    ),
    body: Container(
      child: ListView.builder(
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount,
      )
    ),
  );
}
