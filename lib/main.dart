import 'package:flutter/material.dart';
import 'package:training_flutter_integration/helloservice.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(new DefaultHelloService()),
  ));
}

class MyApp extends StatefulWidget {

  HelloService service;

  MyApp(this.service);

  @override
  _State createState() => new _State(service);
}

class _State extends State<MyApp> {

  HelloService _helloService;

  String _message;

  _State(this._helloService);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Widget Testing Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('${_message??""}'),
            FlatButton(onPressed: refreshMessage, child: Text("Say Hi"))
          ],
        ),
      ),
    );
  }

  void refreshMessage() {
    _helloService.getMessage().then((msg)=>
        setState(()=>_message = msg));
  }
}