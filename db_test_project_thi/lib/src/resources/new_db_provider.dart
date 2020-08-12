import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../model/item_model.dart';
import 'repository.dart';

/*
  BLOB -> List tiplerini kapsayan toplu veri
*/

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
        CREATE TABLE  Items
          (
            id INTEGER PRIMARY KEY,
            title TEXT,
            text TEXT,
            dead INTEGER,
            kids BLOB
          )
      """);
    });
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      //columns: ["title"],
      columns: null,
      //where alanı içerisindeki soru işareti whereArgs içerisindeki ile değiştirilir.
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  // İşi doğrudan bitirip devam etmek istiyoruz
  // o yüzden async eklemiyoruz, biter bitmez result dönecek
  // Bahsedilen bölüm aşağıda
  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMapForDb());
  }

  @override
  Future<List<int>> fetchTopIds() {
    return null;
  }

  /*
  addItem(ItemModel item) async {
    final result = await db.insert("Items", item.toMapForDb());
    print(result);
    return result;
  }
  */

}

final newsDbProvider = NewsDbProvider();
