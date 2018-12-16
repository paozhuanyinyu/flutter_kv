import 'package:flutter/material.dart';
import 'package:flutter_mmkv/flutter_mmkv.dart';
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
    print("存一个布尔类型的true: ${await FlutterMmkv.encodeBool("bool", true)}");
    print("取出刚才存的布尔值： ${await FlutterMmkv.decodeBool("bool", false)}");

    print("存一个int类型的92: ${await FlutterMmkv.encodeInt("int", 92)}");
    print("取出刚才存的int类型值： ${await FlutterMmkv.decodeInt("int", 0)}");

    print("存一个long int类型的9223372036854775806: ${await FlutterMmkv.encodeLong("long", 9223372036854775806)}");
    print("取出刚才存的long int类型值： ${await FlutterMmkv.decodeLong("long")}");

    print("存一个double类型的9223372036.92: ${await FlutterMmkv.encodeDouble("double", 9223372036.92)}");
    print("取出刚才存的double类型值： ${await FlutterMmkv.decodeDouble("double", 0)}");

    print("存一个String类型的true: ${await FlutterMmkv.encodeString("string", "Flutter MMKV")}");
    print("取出刚才存的String类型值： ${await FlutterMmkv.decodeString("string", "error")}");
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
