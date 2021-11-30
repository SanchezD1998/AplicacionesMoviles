import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  final int version = 1;
  var db;

  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'shopping_v2.db'),
          onCreate: (database, version) {
        database.execute('CREATE TABLE lists('
            'id INTEGER PRIMARY KEY,'
            'name TEXT,'
            'priority INTEGER)');
        database.execute('CREATE TABLE items('
            'id INTEGER PRIMARY KEY,'
            'idList INTEGER,'
            'name TEXT,'
            'quantity TEXT,'
            'note TEXT,'
            'FOREING KEY(idlist) REFERENCES lists(id))');
      }, version: version);
    }
    return db;
  }

  Future testDB() async {
    db = await openDb();

    await db.execute('INSERT INTO lists VALUES (0, "Memorias", 1)');
    await db.execute('INSERT INTO items VALUES (0, 0, "Memorias USB", "20 unds.", "Marca Kingstone")');

    List list = await db.rawQuery('SELECT * FROM lists');
    List item = await db.rawQuery('SELECT * FROM items');

    print(list[0]);
    print(item[0]);
  }
}
