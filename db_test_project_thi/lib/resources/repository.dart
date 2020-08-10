import 'dart:async';
import 'new_db_provider.dart';
import '../model/item_model.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();

  // Future<List<int>>
  fetchTopIds() {
    // return apiProvider.fetchTopIds();
  }

  //async varsa return type Future olmalı

  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }
    /* 
    item = await apiProvider.fetchItem(id);
    dbProvider.addItem(item);
    */
    return item;
  }
}
