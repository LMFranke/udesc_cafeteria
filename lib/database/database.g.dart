// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, email, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String name;
  final String email;
  final String password;
  const UserTableData(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  UserTableData copyWith(
          {int? id, String? name, String? email, String? password}) =>
      UserTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String password,
  })  : name = Value(name),
        email = Value(email),
        password = Value(password);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? password}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $ItemShoppingTableTable extends ItemShoppingTable
    with TableInfo<$ItemShoppingTableTable, ItemShoppingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemShoppingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _urlImageMeta =
      const VerificationMeta('urlImage');
  @override
  late final GeneratedColumn<String> urlImage = GeneratedColumn<String>(
      'url_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, price, urlImage];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_shopping_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ItemShoppingTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('url_image')) {
      context.handle(_urlImageMeta,
          urlImage.isAcceptableOrUnknown(data['url_image']!, _urlImageMeta));
    } else if (isInserting) {
      context.missing(_urlImageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemShoppingTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemShoppingTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      urlImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_image'])!,
    );
  }

  @override
  $ItemShoppingTableTable createAlias(String alias) {
    return $ItemShoppingTableTable(attachedDatabase, alias);
  }
}

class ItemShoppingTableData extends DataClass
    implements Insertable<ItemShoppingTableData> {
  final int id;
  final String name;
  final double price;
  final String urlImage;
  const ItemShoppingTableData(
      {required this.id,
      required this.name,
      required this.price,
      required this.urlImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['url_image'] = Variable<String>(urlImage);
    return map;
  }

  ItemShoppingTableCompanion toCompanion(bool nullToAbsent) {
    return ItemShoppingTableCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      urlImage: Value(urlImage),
    );
  }

  factory ItemShoppingTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemShoppingTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      urlImage: serializer.fromJson<String>(json['urlImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'urlImage': serializer.toJson<String>(urlImage),
    };
  }

  ItemShoppingTableData copyWith(
          {int? id, String? name, double? price, String? urlImage}) =>
      ItemShoppingTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        urlImage: urlImage ?? this.urlImage,
      );
  @override
  String toString() {
    return (StringBuffer('ItemShoppingTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('urlImage: $urlImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, urlImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemShoppingTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.urlImage == this.urlImage);
}

class ItemShoppingTableCompanion
    extends UpdateCompanion<ItemShoppingTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> price;
  final Value<String> urlImage;
  const ItemShoppingTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.urlImage = const Value.absent(),
  });
  ItemShoppingTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double price,
    required String urlImage,
  })  : name = Value(name),
        price = Value(price),
        urlImage = Value(urlImage);
  static Insertable<ItemShoppingTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<String>? urlImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (urlImage != null) 'url_image': urlImage,
    });
  }

  ItemShoppingTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? price,
      Value<String>? urlImage}) {
    return ItemShoppingTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      urlImage: urlImage ?? this.urlImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (urlImage.present) {
      map['url_image'] = Variable<String>(urlImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemShoppingTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('urlImage: $urlImage')
          ..write(')'))
        .toString();
  }
}

class $CartsTableTable extends CartsTable
    with TableInfo<$CartsTableTable, CartsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user_table (id)'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES item_shopping_table (id)'));
  static const VerificationMeta _isSendMeta = const VerificationMeta('isSend');
  @override
  late final GeneratedColumn<int> isSend = GeneratedColumn<int>(
      'is_send', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [userId, itemId, isSend];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'carts_table';
  @override
  VerificationContext validateIntegrity(Insertable<CartsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('is_send')) {
      context.handle(_isSendMeta,
          isSend.isAcceptableOrUnknown(data['is_send']!, _isSendMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CartsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartsTableData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      isSend: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_send']),
    );
  }

  @override
  $CartsTableTable createAlias(String alias) {
    return $CartsTableTable(attachedDatabase, alias);
  }
}

class CartsTableData extends DataClass implements Insertable<CartsTableData> {
  final int userId;
  final int itemId;
  final int? isSend;
  const CartsTableData(
      {required this.userId, required this.itemId, this.isSend});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['item_id'] = Variable<int>(itemId);
    if (!nullToAbsent || isSend != null) {
      map['is_send'] = Variable<int>(isSend);
    }
    return map;
  }

  CartsTableCompanion toCompanion(bool nullToAbsent) {
    return CartsTableCompanion(
      userId: Value(userId),
      itemId: Value(itemId),
      isSend:
          isSend == null && nullToAbsent ? const Value.absent() : Value(isSend),
    );
  }

  factory CartsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartsTableData(
      userId: serializer.fromJson<int>(json['userId']),
      itemId: serializer.fromJson<int>(json['itemId']),
      isSend: serializer.fromJson<int?>(json['isSend']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'itemId': serializer.toJson<int>(itemId),
      'isSend': serializer.toJson<int?>(isSend),
    };
  }

  CartsTableData copyWith(
          {int? userId,
          int? itemId,
          Value<int?> isSend = const Value.absent()}) =>
      CartsTableData(
        userId: userId ?? this.userId,
        itemId: itemId ?? this.itemId,
        isSend: isSend.present ? isSend.value : this.isSend,
      );
  @override
  String toString() {
    return (StringBuffer('CartsTableData(')
          ..write('userId: $userId, ')
          ..write('itemId: $itemId, ')
          ..write('isSend: $isSend')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, itemId, isSend);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartsTableData &&
          other.userId == this.userId &&
          other.itemId == this.itemId &&
          other.isSend == this.isSend);
}

class CartsTableCompanion extends UpdateCompanion<CartsTableData> {
  final Value<int> userId;
  final Value<int> itemId;
  final Value<int?> isSend;
  final Value<int> rowid;
  const CartsTableCompanion({
    this.userId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.isSend = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartsTableCompanion.insert({
    required int userId,
    required int itemId,
    this.isSend = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        itemId = Value(itemId);
  static Insertable<CartsTableData> custom({
    Expression<int>? userId,
    Expression<int>? itemId,
    Expression<int>? isSend,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (itemId != null) 'item_id': itemId,
      if (isSend != null) 'is_send': isSend,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartsTableCompanion copyWith(
      {Value<int>? userId,
      Value<int>? itemId,
      Value<int?>? isSend,
      Value<int>? rowid}) {
    return CartsTableCompanion(
      userId: userId ?? this.userId,
      itemId: itemId ?? this.itemId,
      isSend: isSend ?? this.isSend,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (isSend.present) {
      map['is_send'] = Variable<int>(isSend.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartsTableCompanion(')
          ..write('userId: $userId, ')
          ..write('itemId: $itemId, ')
          ..write('isSend: $isSend, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdmUserTableTable extends AdmUserTable
    with TableInfo<$AdmUserTableTable, AdmUserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdmUserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adm_user_table';
  @override
  VerificationContext validateIntegrity(Insertable<AdmUserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdmUserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdmUserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $AdmUserTableTable createAlias(String alias) {
    return $AdmUserTableTable(attachedDatabase, alias);
  }
}

class AdmUserTableData extends DataClass
    implements Insertable<AdmUserTableData> {
  final int id;
  final int userId;
  const AdmUserTableData({required this.id, required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  AdmUserTableCompanion toCompanion(bool nullToAbsent) {
    return AdmUserTableCompanion(
      id: Value(id),
      userId: Value(userId),
    );
  }

  factory AdmUserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdmUserTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
    };
  }

  AdmUserTableData copyWith({int? id, int? userId}) => AdmUserTableData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('AdmUserTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdmUserTableData &&
          other.id == this.id &&
          other.userId == this.userId);
}

class AdmUserTableCompanion extends UpdateCompanion<AdmUserTableData> {
  final Value<int> id;
  final Value<int> userId;
  const AdmUserTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
  });
  AdmUserTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
  }) : userId = Value(userId);
  static Insertable<AdmUserTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
    });
  }

  AdmUserTableCompanion copyWith({Value<int>? id, Value<int>? userId}) {
    return AdmUserTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdmUserTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $ItemShoppingTableTable itemShoppingTable =
      $ItemShoppingTableTable(this);
  late final $CartsTableTable cartsTable = $CartsTableTable(this);
  late final $AdmUserTableTable admUserTable = $AdmUserTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userTable, itemShoppingTable, cartsTable, admUserTable];
}
