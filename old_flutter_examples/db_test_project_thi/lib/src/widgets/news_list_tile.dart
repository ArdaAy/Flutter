import 'dart:async';
import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../blocs/stories_provider.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
        stream: bloc.items,
        builder:
            (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
          if (!snapshot.hasData) {
            return Text('Stream still loadingg');
          }
          return FutureBuilder(
              future: snapshot.data[itemId],
              builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
                if (!itemSnapshot.hasData) {
                  return Text('Still loading');
                }
                return Text(itemSnapshot.data.title);
              });
        });
  }
}
