import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class AddPlace extends StatefulWidget {
  final void Function(Place placeItem) addNewPlace;

  const AddPlace({super.key, required this.addNewPlace});

  @override
  State<AddPlace> createState() {
    return _AddPlaceState();
  }
}

class _AddPlaceState extends State<AddPlace> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";

  void _savePlace() {
    widget.addNewPlace(Place(title: _title));
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
