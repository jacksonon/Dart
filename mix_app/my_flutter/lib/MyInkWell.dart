import 'package:flutter/material.dart';

class MyInkwellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final title = '水波示例';
    return new MaterialApp(
      title: title,
      home: new MyInwellHomePage(title: title,),
    );
  }
}

class MyInwellHomePage extends StatelessWidget {
  final String title;
  MyInwellHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('水波特许爱'),));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text(
          '水波按钮'
        ),
      ),
    );
  }
}