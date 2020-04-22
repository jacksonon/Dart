import 'package:flutter/material.dart';

abstract class CustomFunc {
  void sayHello();
}

class CustomFuncImp extends CustomFunc {
  void sayHello() {
    print('你好：欢迎学习dart');
  }
}

class YouApp extends StatelessWidget {

  @override
  // 相当于加入到绘制队列，只有Widget这里才会进行绘制
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
//    return MaterialApp(
//      title: '容器组件',
//      home:
//    );
  }
}