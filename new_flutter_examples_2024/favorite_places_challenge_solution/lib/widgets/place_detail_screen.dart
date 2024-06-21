import 'package:favorite_places/models/place_item.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  final PlaceItem placeItem;

  PlaceDetailScreen({required this.placeItem});

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
