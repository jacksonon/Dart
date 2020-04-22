import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_flutter/MySecondScreen.dart';

// 继承自有状态的statefulWidget
class OnetimePage extends StatefulWidget {
//  final String title;
//  final String useLabel;
//  SetUpPage({Key key, this.title, this.useLabel}) : super(key: key);

  // 重写createstate方法
  @override
  _OnetimePageState createState() => _OnetimePageState();
}


// 状态类必须继承自state类
class _OnetimePageState extends State<OnetimePage> {


  // 需要设置Scaffold的key才能弹出SnackBar
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  var _showText = true;
  var _info = '展示的信息';
  List<ListItem> items =  new List<ListItem>.generate(
    6,
        (i) => i % 6 == 0
        ? new HeadingItem("Heading $i")
        : new MessageItem("Sender $i", "Message body $i"),
  );

  void _goNext() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(todo: Todo('我的二级界面', '赶紧返回上级界面'))));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldkey, // 用来获取路由context
      appBar: new AppBar(
        title: new Text('动态口令'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: _goNext,
          child: Text('下一个界面'),
        ),
      ),
//      body: new ListView.builder(
//        // Let the ListView know how many items it needs to build
//        itemCount: items.length,
//        // Provide a builder function. This is where the magic happens! We'll
//        // convert each item into a Widget based on the type of item it is.
//        itemBuilder: (context, index) {
//          final item = items[index];
//
//          if (item is HeadingItem) {
//            return new ListTile(
//              title: new Text(
//                item.heading,
//                style: Theme.of(context).textTheme.headline,
//              ),
//            );
//          } else if (item is MessageItem) {
//            return new ListTile(
//              title: new Text(item.sender),
//              subtitle: new Text(item.body),
//            );
//          }
//        },
//      ),
    );
//    return Scaffold(
//      key: _scaffoldkey,
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
////        title: Text(widget.useLabel),
//        title: Text('设置'),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//          child: new Offstage(
//            offstage: _showText,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  'You have pushed the button this many times:',
//                ),
//                Text(
//                  '$_info',
//                  style: Theme.of(context).textTheme.display1,
//                ),
//              ],
//            ),
//          )
//      ),
//    );
  }
}

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
