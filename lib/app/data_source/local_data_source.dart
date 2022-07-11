import 'package:bringideas/app/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  static Future<Database> _openDB() async {
    List<String> queries = [];
    String _sql;

    _sql =
        "CREATE TABLE IF NOT EXISTS user (userMail TEXT, userPass TEXT, userName TEXT); ";

    queries.add(_sql);

    // Crea la base de datos en caso de que no exista y crea las tablas
    return openDatabase(join(await getDatabasesPath(), 'data.db'),
        onCreate: (db, version) async {
      for (String query in queries) {
        await db.execute(query);
      }
    }, version: 1);
  }

  // Inserta una instancia de client
  static Future<int> insertUser(User item) async {
    Database database = await _openDB();

    return database.insert("user", item.toMap());
  }

  // Limpia la tabla local de user
  static Future<void> dropUser() async {
    Database database = await _openDB();
    final batch = database.batch();

    batch.delete("user");

    await batch.commit(noResult: true);
  }

  // Valida si existe un suario
  static Future<User?> validaUserDB(String mail, pass) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> itemsMap = await database.rawQuery(
        'select * from user where userMail = ? and userPass = ?', [mail, pass]);
    if (itemsMap.isEmpty) {
      return null;
    } else {
      return User(
          userMail: itemsMap[0]['userMail'].toString(),
          userPass: itemsMap[0]['userPass'].toString(),
          userName: itemsMap[0]['userName'].toString());
    }
    ;
  }
}
