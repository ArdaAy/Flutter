import 'package:flutter/material.dart';
import '../models/ImageModel.dart';
// kendini değiştirmeyecek, başka class değiştirecek
// o yüzden StatelessWidget
// statelesswidget değişemez olduğundan attribute'lar final olmalı
class ImageList extends StatelessWidget{
  final List<ImageModel> images;
  
  ImageList(this.images);
  
  
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
        //return Image.network(images[index].url);
      },
    );
  }

  Widget buildImage(ImageModel image){
    return Container(
          //  EdgeInsets.all -> her kenara uygulanır
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          child: Column(
            children: <Widget>[
              Image.network(image.url),
              Padding(
                child: Text(image.title),
                padding: EdgeInsets.only(
                  top: 10.0,
                  
                ),
              ),
              
            ],
          ),
        );
  }

}