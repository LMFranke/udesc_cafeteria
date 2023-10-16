import 'dart:io';

import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:udesc_v2/model/person.dart';

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
}

class ItemShoppingTable extends Table {
  @override
  String get tableName => 'item_shopping_table';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  RealColumn get price => real()();

  TextColumn get urlImage => text()();
}

@DriftDatabase(tables: [UserTable, CartsTable, ItemShoppingTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

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
      },
    );
  }

  Future<List<UserTableData>> get getAllPeople => select(userTable).get();
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

  Future<List<UserTableData>> getAuthPerson(String email, String password) {
    return (select(userTable)
          ..where((a) => a.email.equals(email) & a.password.equals(password)))
        .get();
  }

  Future<int> getItemShoppingCount() async {
    final countResult = await customSelect('SELECT COUNT(*) AS count FROM item_shopping_table').getSingle();
    return countResult.read<int>('count');
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

