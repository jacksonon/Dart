import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String desc;
  Todo(this.title, this.desc);
}

class SecondScreen extends StatelessWidget {

  // 获取传递数据:基本是固定写法
  final Todo todo;
  SecondScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
//        title: Text("${todo.title}"),
//      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print('带值返回上级界面');
            Navigator.pop(context, '嘿嘿嘿');
          },
          child: Text('${todo.desc}'),
        ),
      ),
    );
  }
}