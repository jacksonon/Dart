import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
    height: 120,
    color: Colors.white,
    child: GestureDetector(
      // 手势包裹
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 5.0),
            child: Center(
              child: Icon(
                state.type == 1 ? Icons.account_circle : Icons.account_box,
                size: 50.0,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 30,
                  child: Text(
                    state.title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Text(
                  state.content,
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          )
        ],
      ),
      onTap: () {
        // todo 点击事件
        dispatch(ItemActionCreator.onThemeChange());
      },
    ),
  );
}
