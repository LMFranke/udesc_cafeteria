import 'package:flutter/foundation.dart';

import '../model/item.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> _listItem = [
    Item(id: 0, imageUrl: "imageUrl", name: "Item 1", price: 15),
    Item(id: 1, imageUrl: "imageUrl", name: "Item 2", price: 25),
    Item(id: 2, imageUrl: "imageUrl", name: "Item 3", price: 35),
    Item(id: 3, imageUrl: "imageUrl", name: "Item 4", price: 55),
  ];

  final List<Item> _userListItem = [];

  List<Item> get getListItem => _listItem;
  List<Item> get getUserListItem => _userListItem;

  void addUserItem(Item item) {
    _userListItem.add(item);
    notifyListeners();
  }

  void removeUserItem(Item item) {
    _userListItem.remove(item);
    notifyListeners();
  }

  void addItem(Item item) {
    _listItem.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _listItem.remove(item);
    notifyListeners();
  }

}
