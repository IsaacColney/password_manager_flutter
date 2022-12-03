import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:password_manager/models/password_data_models.dart';

class SQLDatabaseUtils {
  static final SQLDatabaseUtils instance = SQLDatabaseUtils._init();
  static Database? _database;

  SQLDatabaseUtils._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("password.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const urlType = "TEXT";
    const userNameType = "TEXT";
    const passwordType = "TEXT";

    await db.execute('''
     CREATE TABLE $passwordTable (
      ${PasswordField.id} $idType,
      ${PasswordField.url} $urlType,
      ${PasswordField.userName} $userNameType,
      ${PasswordField.password} $passwordType

     )''');
  }

  Future<PasswordDataModel> create(PasswordDataModel passwordData) async {
    Database db = await instance.database;
    int id = await db.insert(passwordTable, passwordData.toMap());
    return passwordData.copy(id: id);
  }

  Future<PasswordDataModel> readPasswordBySiteName(String siteName) async {
    Database db = await instance.database;
    final map = await db.query(passwordTable,
        columns: PasswordField.values,
        where: '${PasswordField.siteName} = ?',
        whereArgs: [siteName]);
    if (map.isNotEmpty) {
      return PasswordDataModel.fromJson(map.first);
    } else {
      throw Exception("Site Name $siteName not found!");
    }
  }

  Future<List<PasswordDataModel>> readAllPassword() async {
    Database db = await instance.database;
    String orderBy = '${PasswordField.siteName} ASC';
    final result = await db.query(passwordTable, orderBy: orderBy);
    return result.map((json) => PasswordDataModel.fromJson(json)).toList();
  }

  Future<int> update(PasswordDataModel password) async {
    Database db = await instance.database;
    return db.update(passwordTable, password.toMap(),
        where: '${PasswordField.id} = ?', whereArgs: [password.id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(passwordTable,
        where: '${PasswordField.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
