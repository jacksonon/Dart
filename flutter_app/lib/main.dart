import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';// 应用内网页访问
import 'package:http/http.dart' as http; // 网路请求基础类
import 'dart:convert'; // httpclient需要导入如下两个包
import 'dart:io';
import 'perfectworld.dart';
import 'MyInkWell.dart';
import 'MySecondScreen.dart';
import 'dart:ui' as ui;

//void main() => runApp(TestApp());
//void main() => runApp(TestApp());
void main() {
  ui.window.setIsolateDebugName("debug isolate");
  return runApp(MyApp());
}

class YouApp extends StatelessWidget {

  @override
  // 相当于加入到绘制队列，只有Widget这里才会进行绘制
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '容器组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('容器组件实例'),
        ),
        body: Center(
          child: Builder(builder: (BuildContext context) {
            return new GestureDetector(
              onTap: () {
                print('点击整体容器');
                final snackBar = SnackBar(content: new Text("GestureDetector手势想要"),);
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                      color: Colors.grey,
                      width: 8.0,
                    )
                ),
                child: Text(
                  'Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
            );
          })
        ),
      ),
    );
  }
}

abstract class CustomFunc {
  void sayHello();
}

class CustomFuncImp extends CustomFunc {
  void sayHello() {
    print('你好：欢迎学习dart');
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 提供一个主题
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', useLabel: '嘿嘿额黑',),
    );
  }
}
// 继承自有状态的statefulWidget
class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String useLabel;
  MyHomePage({Key key, this.title, this.useLabel}) : super(key: key);

  // 重写createstate方法
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 状态类必须继承自state类
class _MyHomePageState extends State<MyHomePage> {


  // 需要设置Scaffold的key才能弹出SnackBar
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  // 定义普通变量作为计数器变量
  int _counter = 0;

  String _info = "";

  bool _showText = false;

  void _getWeatherData() async {
    var cf = CustomFuncImp();
    cf.sayHello();
    try {
      // httpclient发起一个网络请求
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"));
      HttpClientResponse response = await request.close();
      var result = await response.transform(utf8.decoder).join();
      print(result);

      httpClient.close();
      setState(() {
        _info = result;
      });
    } catch (e) {
      print("请求失败：$e");
    } finally {

    }
  }

   void _navigateAndDisplaySecond() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen(todo: Todo('我的二级界面', '返回上级界面'))),
    );

    print('接收到返回值:${result}');

    // 获取了返回值,弹窗展示
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text('${result}'),));
   _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('${result}'),));
  }

  void _toggleShow() {
    // 跳转下一个界面
    // 创建todo
    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(todo: Todo('我的二级界面', '赶紧返回上级界面'))));


    setState(() {
      _showText = !_showText;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
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
        onPressed: _navigateAndDisplaySecond,
        tooltip: '反转',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


