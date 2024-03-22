import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryList = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryList.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryList.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceryList.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryList.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(_groceryList[index].id),
          background: Container(
            color: Colors.red.withOpacity(0.75),
          ),
          onDismissed: (direction) {
            _removeItem(_groceryList[index]);
          },
          child: ListTile(
            title: Text(_groceryList[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryList[index].category.color,
            ),
            trailing: Text(_groceryList[index].quantity.toString()),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(onPressed: _addItem, icon: const Icon(Icons.add))
          ],
        ),
        body: content);
  }
}
