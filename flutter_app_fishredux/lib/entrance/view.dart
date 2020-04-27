import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(EntranceState state, Dispatch dispatch, ViewService viewService) {
//  return Container();
  return Scaffold(
    appBar: AppBar(
      title: Text('Fish redux'),
      backgroundColor: state.themeColor,
    ),
    body: Container(
      child: Center(
        child: RaisedButton(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          color: Colors.green,
          child: Text(
            state.showLabel,
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: () {
            // todo 点击事件
//            dispatch(EntranceActionCreator.onChangeShowLabel());
            dispatch(EntranceActionCreator.onOpenGrid());
          },
        ),
      ),
    ),
  );
}

