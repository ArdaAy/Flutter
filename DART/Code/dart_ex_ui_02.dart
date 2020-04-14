//Dart_02
// 16.02.19
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("nerde"),
        ),
        body: Card(
          child: Column(
            children: <Widget>[
              Image.asset("assets/food.jpg"),
              Text("Food Paradise")
            ],
          ),
        ),
      ),
    );
  }
}
