import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlacesDetail extends StatelessWidget {
  final Place placeItem;

  PlacesDetail({required this.placeItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(placeItem.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(placeItem.title),
      ),
    );
  }
}
