import 'package:favorite_places/models/place_item.dart';
import 'package:flutter/material.dart';

class NewPlace extends StatefulWidget {
  final void Function(PlaceItem placeItem) addNewPlace;

  const NewPlace({super.key, required this.addNewPlace});

  @override
  State<NewPlace> createState() {
    return _NewPlaceState();
  }
}

class _NewPlaceState extends State<NewPlace> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";

  void _savePlace() {
    widget.addNewPlace(PlaceItem(title: _title));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Place"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Title"),
              onSaved: (newValue) {
                if (newValue != null) {
                  _title = newValue;
                }
              },
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                _savePlace();
              },
              label: const Text("Add Place"),
              icon: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
