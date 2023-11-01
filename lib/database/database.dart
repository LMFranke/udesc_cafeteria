import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:udesc_v2/model/item.dart';
import 'package:udesc_v2/model/request_item.dart';
import 'package:udesc_v2/storage/shared_preference.dart';

import '../model/person.dart';

part 'database.g.dart';

class UserTable extends Table {
  @override
  String get tableName => 'user_table';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text()();

  TextColumn get password => text()();
}

class CartsTable extends Table {
  @override
  String get tableName => 'carts_table';

  IntColumn get userId => integer().references(UserTable, #id)();

  IntColumn get itemId => integer().references(ItemShoppingTable, #id)();

  IntColumn get isSend => integer().nullable()();
}

class ItemShoppingTable extends Table {
  @override
  String get tableName => 'item_shopping_table';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  RealColumn get price => real()();

  TextColumn get urlImage => text()();
}

class AdmUserTable extends Table {
  @override
  String get tableName => 'adm_user_table';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(UserTable, #id)();
}

@DriftDatabase(tables: [UserTable, CartsTable, ItemShoppingTable, AdmUserTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.createTable(cartsTable);
          await m.createTable(itemShoppingTable);
        }
        if (from < 3) {
          await m.addColumn(cartsTable, cartsTable.isSend);
        }
        if (from < 4) {
          await m.createTable(admUserTable);
        }
      },
    );
  }

  SaveSharedPreference prefs = SaveSharedPreference();

  Future<List<UserTableData>> get getAllPeople => select(userTable).get();

  Future<List<AdmUserTableData>> get getAllAdmId => select(admUserTable).get();

  Future<List<CartsTableData>> get getAllCartsToPeople => select(cartsTable).get();

  Future<List<ItemShoppingTableData>> get getAllItems => select(itemShoppingTable).get();

  Future<int> addPerson(UserTableCompanion person) {
    return into(userTable).insert(person);
  }

  Future<int> addItemToPerson(CartsTableCompanion itemToPerson) {
    return into(cartsTable).insert(itemToPerson);
  }

  Future<int> addItem(ItemShoppingTableCompanion item) {
    return into(itemShoppingTable).insert(item);
  }

  Future<int> addAdm(AdmUserTableCompanion adm) {
    return into(admUserTable).insert(adm);
  }

  Future<List<UserTableData>> getAuthPerson(String email, String password) {
    return (select(userTable)
      ..where((a) => a.email.equals(email) & a.password.equals(password)))
        .get();
  }

  Future<List<CartsTableData>> getCartsByPersonId(int personId) {
    return (select(cartsTable)
      ..where(
              (tbl) => tbl.userId.equals(personId) & tbl.isSend.isNotValue(1)))
        .get();
  }

  Future<List<AdmUserTableData>> getAdmByPersonId(int personId) {
    return (select(admUserTable)
      ..where((tbl) => tbl.userId.equals(personId)))
        .get();
  }

  Future<List<UserTableData>> getPersonById(int personId) {
    return (select(userTable)
      ..where((tbl) => tbl.id.equals(personId))).get();
  }

  Future<List<ItemShoppingTableData>> getCartById(int cartId) {
    return (select(itemShoppingTable)
      ..where((tbl) => tbl.id.equals(cartId)))
        .get();
  }

  Future<int> getItemShoppingCount() async {
    final countResult =
    await customSelect('SELECT COUNT(*) AS count FROM item_shopping_table').getSingle();
    return countResult.read<int>('count');
  }

  Future<List<CartsTableData>> getAllSendItems() async {
    return await (select(cartsTable)
      ..where((a) => a.isSend.equals(1))).get();
  }

  void removeItem(int itemId) async {
    (delete(cartsTable)..where((tbl) => tbl.itemId.equals(itemId))).go();
    (delete(itemShoppingTable)..where((tbl) => tbl.id.equals(itemId))).go();
  }

  void removeUser(int userId) async {
    (delete(cartsTable)..where((tbl) => tbl.userId.equals(userId))).go();
    (delete(admUserTable)..where((tbl) => tbl.userId.equals(userId))).go();
    (delete(userTable)..where((tbl) => tbl.id.equals(userId))).go();
  }

  Future updateItem(ItemShoppingTableData item) async {
    return (update(itemShoppingTable)..where((tbl) => tbl.id.equals(item.id))).write(item);
  }

  Future updateItemsFromPerson(int itemId) async {
    int? userId = await prefs.getUserId();
    return (update(cartsTable)
      ..where(
              (tbl) => tbl.itemId.equals(itemId) & tbl.userId.equals(userId!)))
        .write(const CartsTableCompanion(isSend: Value(1)));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(
        () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    },
  );
}
