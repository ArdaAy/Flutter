import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
  
}

class AppState extends State<App>{
  String txtResponse = "";
  
  
  void buttonPressed() async {
    var response = await get('http://194.169.120.214/api/user/getall?CreaUser=0&ModUser=0');

    Map<String, dynamic> parsedJson = json.decode(response.body);
    
    setState(() {
      txtResponse = parsedJson['Result'][0].toString();
    });

    

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text(txtResponse),
        floatingActionButton: FloatingActionButton(
          onPressed: buttonPressed,
          child: Icon(Icons.accessibility),
          ),
        appBar: AppBar(
          title: Text("Response Test"),
        ),
      ),
    );
  }
}