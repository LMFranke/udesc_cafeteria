import 'package:udesc_v2/model/item.dart';
import 'package:udesc_v2/model/person.dart';

class RequestItem extends Item {
  Person person;

  RequestItem({
    required this.person,
    required super.id,
    required super.imageUrl,
    required super.name,
    required super.price,
  });
}
