
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database(String table)async{
    final dbPath = await getDatabasesPath();
    return  openDatabase(path.join(dbPath,'places.db'),onCreate: (db,version){
      return db.execute('CREATE TABLE $table(id TEXT PRIMARY KEY,title TEXT, image TEXT)');
    }, version: 1);


  }
  static Future<void> insert(String table, Map<String, Object> data)async{
    final db = await DBHelper.database(table);
    db.insert(table, data,conflictAlgorithm: ConflictAlgorithm.replace);


  }
  static Future<List<Map<String, dynamic>>> fetchData(String table,)async{
    final db = await DBHelper.database(table);
    return db.query(table);
  }
}