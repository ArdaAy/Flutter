import 'package:favorite_places/models/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlacesList extends StatefulWidget {
  @override
  State<PlacesList> createState() {
    return _PlacesListState();
  }
}

class _PlacesListState extends State<PlacesList> {
  final List<PlaceItem> _placesList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _placesList.length,
        itemBuilder: (context, index) {
          return Text(_placesList[index].title);
        },
      ),
    );
  }
}
