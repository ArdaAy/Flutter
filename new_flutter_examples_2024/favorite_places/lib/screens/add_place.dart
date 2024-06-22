import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  final void Function(Place placeItem) addNewPlace;

  const AddPlaceScreen({super.key, required this.addNewPlace});

  @override
  State<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: const Text('Add Title'),
            ),
          ],
        ),
      ),

      /*Form(
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
      ),*/
    );
  }
}
