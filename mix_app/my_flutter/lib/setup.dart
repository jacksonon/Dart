import 'package:flutter/material.dart';

// 继承自有状态的statefulWidget
class SetUpPage extends StatefulWidget {
//  final String title;
//  final String useLabel;
//  SetUpPage({Key key, this.title, this.useLabel}) : super(key: key);

  // 重写createstate方法
  @override
  _SetUpPageState createState() => _SetUpPageState();
}


// 状态类必须继承自state类
class _SetUpPageState extends State<SetUpPage> {


  // 需要设置Scaffold的key才能弹出SnackBar
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  var _showText = true;
  var _info = '展示的信息';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.useLabel),
        title: Text('设置'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: new Offstage(
            offstage: _showText,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_info',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          )
      ),
    );
  }
}
