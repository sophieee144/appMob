import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqlDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'tp6.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return mydb;
  }

  void main() async {
    // Initialize sqflite ffi
    sqfliteFfiInit();

    // Set the database factory
    databaseFactory = databaseFactoryFfi;

    // Open the database
    final database = await openDatabase(
      join(await getDatabasesPath(), 'tp6.db'),
    );

    // Perform database operations...

    // Close the database
    await database.close();
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "recipes" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "titre" VARCHAR(30) NOT NULL ,
      "etapes" VARCHAR(300) ,
      "keywords" VARCHAR(30)
    )
  ''');
    print("create DATABASE AND TABLE");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
