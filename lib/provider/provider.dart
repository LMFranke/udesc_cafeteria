import 'package:flutter/foundation.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/model/person.dart';

import '../model/item.dart';
import '../model/request_item.dart';
import '../storage/shared_preference.dart';

class MyProvider extends ChangeNotifier {
  MyDatabase database = MyDatabase();
  SaveSharedPreference prefs = SaveSharedPreference();

  Future<List<ItemShoppingTableData>> getAllItems() async {
    return await database.getAllItems;
  }

  Future<List<CartsTableData>> getAllItemsOnCart() async {
    return await database.getAllCartsToPeople;
  }

  Future<List<UserTableData>> getAllUsers() async {
    return await database.getAllPeople;
  }

  Future<List<AdmUserTableData>> getAllAdmUsers() async {
    return await database.getAllAdmId;
  }

  void addUser(UserTableCompanion person) {
    database.addPerson(person);
    notifyListeners();
  }

  void addItemToPersonCart(CartsTableCompanion itemPerson) {
    database.addItemToPerson(itemPerson);
  }

  void addItem(ItemShoppingTableCompanion item) {
    database.addItem(item);
    notifyListeners();
  }

  void addAdm(AdmUserTableCompanion adm) {
    database.addAdm(adm);
    notifyListeners();
  }

  Future<Person> getPersonByEmailAndPassword(
      String email, String password) async {
    var person = await database.getAuthPerson(email, password);
    return Person(
      id: person.first.id,
      name: person.first.name,
      email: person.first.email,
      password: person.first.password,
    );
  }

  Future<List<CartsTableData>> getCartsByPersonId(int personId) {
    return database.getCartsByPersonId(personId);
  }

  Future<Person> getUserById(int personId) async {
    var person = await database.getPersonById(personId);
    return Person(
      id: person.first.id,
      name: person.first.name,
      email: person.first.email,
      password: person.first.password,
    );
  }

  Future<List<AdmUserTableData>> getAdmByPersonId(int personId) {
    return database.getAdmByPersonId(personId);
  }

  Future<Item> getItemById(int itemId) async {
    var item = await database.getCartById(itemId);
    return Item(
      id: item.first.id,
      imageUrl: item.first.urlImage,
      name: item.first.name,
      price: item.first.price,
    );
  }

  Future<int> getItemsCount() {
    return database.getItemShoppingCount();
  }

  Future<List<RequestItem>> getAllSendItems() async {
    final List<CartsTableData> list = await database.getAllSendItems();
    final List<RequestItem> listItems = [];

    for (int i = 0; i < list.length; i++) {
      final cart = await getItemById(list.elementAt(i).itemId);
      final Person person = await getUserById(list.elementAt(i).userId);

      listItems.add(RequestItem(
        person: Person(
          id: person.id,
          name: person.name,
          email: person.email,
          password: person.password,
        ),
        id: list.elementAt(i).id,
        imageUrl: cart.imageUrl,
        name: cart.name,
        price: cart.price, item: null,
      ));
    }

    return listItems;
  }

  Future<List<Item>> getItemsFromPerson() async {
    int? personId = await prefs.getUserId();
    final List<Item> list = [];

    final cartsPerson = await getCartsByPersonId(personId!);
    for (int i = 0; i < cartsPerson.length; i++) {
      var cartId = await database.getCartById(cartsPerson.elementAt(i).itemId);
      list.add(Item(
        id: cartId.first.id,
        imageUrl: cartId.first.urlImage,
        name: cartId.first.name,
        price: cartId.first.price,
      ));
    }

    return list;
  }

  Future<List<Item>> getShopItems() async {
    final List<ItemShoppingTableData> list = await database.getAllItems;
    final List<Item> listItems = [];

    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        listItems.add(Item(
          id: list.elementAt(i).id,
          imageUrl: list.elementAt(i).urlImage,
          name: list.elementAt(i).name,
          price: list.elementAt(i).price,
        ));
      }
    }

    return listItems;
  }

  void updateItemSent(int itemId) {
    database.updateItemsFromPerson(itemId);
  }

  void updateItem(ItemShoppingTableData item) async {
    database.updateItem(item);
    notifyListeners();
  }

  void removeItem(int itemId) {
    database.removeItem(itemId);
    notifyListeners();
  }

  void removeUser(int userId) {
    database.removeUser(userId);
    notifyListeners();
  }
}
