import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/contact.dart';

class ContactsDatabase {
  static final ContactsDatabase instance = ContactsDatabase._init();

  static Database? _database;

  ContactsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes3.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableContactos (
      ${ContactFields.id} $idType, 
      ${ContactFields.nombre} $textType,
      ${ContactFields.apellido} $textType,
      ${ContactFields.parentesco} $textType,
      ${ContactFields.correo} $textType,
      ${ContactFields.telefono} $textType
      )
    ''');
  }

  Future<Contact> create(Contact contactos) async {
    final db = await instance.database;

    final id = await db.insert(tableContactos, contactos.toJson());
    return contactos.copy(id: id);
  }

  Future<Contact> readContact(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableContactos,
      columns: ContactFields.values,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Contact.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Contact>> readAllContacts() async {
    final db = await instance.database;

    final orderBy = '${ContactFields.id} ASC';

    final result = await db.query(tableContactos, orderBy: orderBy);

    return result.map((json) => Contact.fromJson(json)).toList();
  }

  Future<int> update(Contact contactos) async {
    final db = await instance.database;

    return db.update(
      tableContactos,
      contactos.toJson(),
      where: '${ContactFields.id} = ?',
      whereArgs: [contactos.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableContactos,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}