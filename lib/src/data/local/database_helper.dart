import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const dbName = "ecommerce.db";

  static final DataBaseHelper instance = DataBaseHelper._internal();

  factory DataBaseHelper() => instance;

  static Database? _db;

  DataBaseHelper._internal();

  String colId = 'id';
  String colName = 'name';

  Future<Database?> get database async {
    // _db ??= await initializeDatabase();
    return _db;
  }

// Future<Database> initializeDatabase() async{
//   Directory directory = await getApplicationDocumentsDirectory();
//   String path = directory.path + dbName;
//
//   var roomTable = await openDatabase(path, version: 1, onCreate: _createDb);
// }
//
// /// Create Table
// void _createDb(Database db, int newVersion) async {
//   await db.execute('CREATE TABLE $roomTable('
//       '$colId TEXT,'
//       '$colName TEXT,'
//       '$colUsers TEXT,'
//       '$colMessages TEXT,'
//       '$colPicture TEXT,'
//       '$colCreatedTime TEXT,'
//       '$colUpdatedTime TEXT)');
// }
}
