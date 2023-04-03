import 'package:animal_db/modals/db_modal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  String ID = "id";
  String Name = "name";
  String Description = "description";
  String Image = "image";
  String Type = "type";
  String tableName = "animalData";

  Database? db;

  Future<void> initDB() async {
    var directory = await getDatabasesPath();
    String path = join(directory, "animal.db");

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          String query =
              "CREATE TABLE IF NOT EXISTS $tableName($ID INTEGER PRIMARY KEY AUTOINCREMENT, $Name TEXT, $Description TEXT, $Image TEXT, $Type TEXT);";
          await db.execute(query);
        });
  }

  Future<int> insertData({required Animal data}) async {
    await initDB();

    String query =
        "INSERT INTO $tableName($Name,$Description,$Image,$Type) VALUES (?,?,?,?);";
    List args = [data.name, data.description, data.image, data.type];
    print(query);
    int res = await db!.rawInsert(query);
    return res;
  }

  Future<List<Animal>> fetchData({required String type}) async {
    await initDB();
    String query = "SELECT * FROM $tableName WHERE $Type='$type';";
    List<Map<String, dynamic>> dbdata = await db!.rawQuery(query);
    print(dbdata);
    return dbdata.map((e) => Animal.fromMap(e)).toList();
  }
}
