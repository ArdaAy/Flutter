import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/places_detail.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlacesScreen extends StatefulWidget {
  PlacesScreen({super.key});
  @override
  State<PlacesScreen> createState() {
    return _PlacesState();
  }
}

class _PlacesState extends State<PlacesScreen> {
  final List<Place> _placesList = [];

  void _addNewPlace(Place placeItem) {
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
                      builder: (context) => AddPlaceScreen(
                        addNewPlace: _addNewPlace,
                      ),
                    ));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: PlacesList(places: _placesList),
      /*ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _placesList.length,
        itemBuilder: (context, index) {
          return TextButton(
              style: ButtonStyle(alignment: Alignment.centerLeft),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlacesDetail(placeItem: _placesList[index]),
                  ),
                );
              },
              child: Text(
                _placesList[index].title,
                textAlign: TextAlign.left,
              )); //
        },
      ),*/
    );
  }
}
