import 'dart:convert';

class ItemModel {
  int id;
  String title;
  String text;
  bool dead;
  List<dynamic> kids;

  ItemModel(this.id, this.title, this.text, this.dead, this.kids);

  ItemModel.fromDb(Map<String, dynamic> parsedDb)
      : id = parsedDb['id'],
        title = parsedDb['title'],
        text = parsedDb['text'],
        dead = parsedDb['dead'] == 1,
        kids = jsonDecode(parsedDb['kids']);

  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
      "id": this.id,
      "title": this.title,
      "text": this.text,
      "dead": this.dead ? 1 : 0,
      "kids": jsonEncode(kids)
    };
  }
}
