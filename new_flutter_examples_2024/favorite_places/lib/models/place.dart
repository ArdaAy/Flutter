import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceItem {
  final String id;
  final String title;

  PlaceItem({required this.title}) : id = uuid.v4();
}
