import 'package:udesc_v2/model/item.dart';
import 'package:udesc_v2/model/person.dart';

class RequestItem {
  int id;
  Person person;
  Item item;

  RequestItem({
    required this.id,
    required this.person,
    required this.item,
  });
}
