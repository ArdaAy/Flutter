// Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/ImageModel.dart';
import 'dart:convert';
import 'widgets/image_list.dart';


// import 'package:http/http.dart' as http;
class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
  
}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage, // metod parantezlerini kullanmadık
          child: Icon(Icons.accessibility),
        ),
        body: ImageList(images),
      ),
    );
  }

}


/*
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print("Hi");
          },
          child: Icon(Icons.accessibility),
        ),
      ),
    );
  }

}
*/
// Must define a 'build' method that returns
// the widgets that *this* widget will show