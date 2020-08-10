import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "test.db");

  // Check if the database exists
  var exists = await databaseExists(path);
  print(exists);
  if (!exists) {
    // Should happen only the first time you launch your application
    print("Creating new copy from asset");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("lib/assets", "test.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  } else {
    print("Opening existing database");
  }
  // open the database
  var db = await openDatabase(path, readOnly: true);
  print(path);
}
