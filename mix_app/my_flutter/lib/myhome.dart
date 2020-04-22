import 'package:flutter/material.dart';
import 'package:my_flutter/YouApp.dart';
import 'package:url_launcher/url_launcher.dart';// 应用内网页访问
import 'package:http/http.dart' as http; // 网路请求基础类
import 'dart:convert'; // httpclient需要导入如下两个包
import 'package:flutter_boost/flutter_boost.dart'; // 混合栈管理
import 'dart:io';
import 'dart:ui' as ui;

import 'perfectworld.dart'; // 完美世界介绍页面
import 'MyInkWell.dart'; // 自定义按钮水波动画界面
//import 'MySecondScreen.dart'; // 自定义第二屏幕界面



// 继承自有状态的statefulWidget
class MyHomePage extends StatefulWidget {
  final String title;
  final String useLabel;
  MyHomePage({Key key, this.title, this.useLabel}) : super(key: key);

  // 重写createstate方法
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 监听跳转路由的各种状态
class TestBoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    // TODO: implement didPush
    print('flutterboost#didpush');
  }

  @override
  void didPop(Route route, Route previousRoute) {
    // TODO: implement didPop
    print('flutterboost#didpop');
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    // TODO: implement didRemove
    print('flutterboost#didremove');
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    // TODO: implement didReplace
    print('flutterboost#didreplace');
  }
}

// 状态类必须继承自state类
class _MyHomePageState extends State<MyHomePage> {


  // 需要设置Scaffold的key才能弹出SnackBar
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  // 定义普通变量作为计数器变量
  int _counter = 0;

  String _info = "";

  bool _showText = false;

//  void _getWeatherData() async {
//    try {
//      // httpclient发起一个网络请求
//      HttpClient httpClient = new HttpClient();
//      HttpClientRequest request = await httpClient.getUrl(Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"));
//      HttpClientResponse response = await request.close();
//      var result = await response.transform(utf8.decoder).join();
//      print(result);
//
//      httpClient.close();
//      setState(() {
//        _info = result;
//      });
//    } catch (e) {
//      print("请求失败：$e");
//    } finally {
//
//    }
//  }

//   void _navigateAndDisplaySecond() async {
//    final result = await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => SecondScreen(todo: Todo('我的二级界面', '返回上级界面'))),
//    );
//
//    print('接收到返回值:${result}');
//
//
//    // 使用全局key获取scaffold.showSnackBar
//   _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('${result}'),));
//  }

  void _toggleShow() {
    // 跳转下一个界面
    // 创建todo
//    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(todo: Todo('我的二级界面', '赶紧返回上级界面'))));

    setState(() {
      _showText = !_showText;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      // http框架发起一个网络请求
      var httpurl = 'http://httpbin.org/';
      http.get(httpurl).then((response) {
        print("状态: ${response.statusCode}");
        print("正文: ${response.body}");
      });

      // 打开一个新的1网页
      const url = 'http://www.baidu.com';
      launch(url);
    });
  }

  @override
  void initState() {
    super.initState();
    FlutterBoost.singleton.registerPageBuilders({
      'wanmei': (pageName, params, _) => TestApp(),
      'youapp': (pageName, params, _) => YouApp(),
      'inkwell': (pageName, params, _) => MyInkwellApp(),
    });
    // 绑定观察者
    FlutterBoost.singleton.addBoostNavigatorObserver(TestBoostNavigatorObserver());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.useLabel),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleShow,
        tooltip: '反转',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


