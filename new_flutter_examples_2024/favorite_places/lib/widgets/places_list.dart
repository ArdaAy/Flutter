import 'package:favorite_places/models/place_item.dart';
import 'package:favorite_places/widgets/new_place.dart';
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

  void _addNewPlace(PlaceItem placeItem) {
    setState(() {
      _placesList.add(placeItem);
    });
    for (var i = 0; i < _placesList.length; i++) {
      print(_placesList[i].title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPlace(
                        addNewPlace: _addNewPlace,
                      ),
                    ));
              },
              icon: Icon(Icons.add))
        ],
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
