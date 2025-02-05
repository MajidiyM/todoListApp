import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static final DatabaseProvider instance = DatabaseProvider._init();
  static Database? _database;

  DatabaseProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);


    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    // Определяем типы данных для колонок
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const intType = 'INTEGER';

    await db.execute('''
      CREATE TABLE tasks (
        id $idType,
        title $textType NOT NULL,
        startDate $intType,
        endDate $intType,
        category $intType,
        priority $intType
      )
    ''');
  }
}
