import 'package:flutter/material.dart';
import 'package:flutter_kv/flutter_kv.dart';
void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async{
    setState(() {
      _counter++;
    });
    print("count: $_counter");
    print("存一个布尔类型的true: ${await FlutterKV.encodeBool("bool", true)}");
    print("取出刚才存的布尔值： ${await FlutterKV.decodeBool("bool", false)}");

    print("存一个int类型的92: ${await FlutterKV.encodeInt("int", 92)}");
    print("取出刚才存的int类型值： ${await FlutterKV.decodeInt("int", 0)}");

    print("存一个long int类型的9223372036854775806: ${await FlutterKV.encodeLong("long", 9223372036854775806)}");
    print("取出刚才存的long int类型值： ${await FlutterKV.decodeLong("long",1)}");

    print("存一个double类型的92233720369292.92: ${await FlutterKV.encodeDouble("double", 92233720369292.92)}");
    print("取出刚才存的double类型值： ${await FlutterKV.decodeDouble("doubledouble", 1)}");

    print("存一个String类型的true: ${await FlutterKV.encodeString("string", "Flutter MMKV")}");
    print("取出刚才存的String类型值： ${await FlutterKV.decodeString("string", "error")}");

    print("删除key为string的值: ${await FlutterKV.remove("string")}");
    print("是否存储了key为string的值: ${await FlutterKV.containsKey("string")}");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
