import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  //ItemModel(this.id, this.title, this.text, this.dead, this.kids);

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'],
        type = parsedJson['type'],
        by = parsedJson['by'],
        time = parsedJson['time'],
        text = parsedJson['text'],
        dead = parsedJson['dead'],
        parent = parsedJson['parent'],
        kids = parsedJson['kids'],
        url = parsedJson['url'],
        score = parsedJson['score'],
        title = parsedJson['title'],
        descendants = parsedJson['descendants'];

  ItemModel.fromDb(Map<String, dynamic> parsedDb)
      : id = parsedDb['id'],
        deleted = parsedDb['deleted'] == 1,
        type = parsedDb['type'],
        by = parsedDb['by'],
        time = parsedDb['time'],
        text = parsedDb['text'],
        dead = parsedDb['dead'] == 1,
        parent = parsedDb['parent'],
        kids = jsonDecode(parsedDb['kids']),
        url = parsedDb['url'],
        score = parsedDb['score'],
        title = parsedDb['title'],
        descendants = parsedDb['descendants'];

  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
      "id": this.id,
      "deleted": this.deleted ? 1 : 0,
      "type": this.type,
      "by": this.by,
      "time": this.time,
      "text": this.text,
      "dead": this.dead ? 1 : 0,
      "parent": this.parent,
      "kids": jsonEncode(kids),
      "url": this.url,
      "score": this.score,
      "title": this.title,
      "descendants": this.descendants
    };
  }
}
