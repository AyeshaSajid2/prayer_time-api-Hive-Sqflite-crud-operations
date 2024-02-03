import 'package:assignment_two/data_sqflite/model_student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

final String database_name = "Studenet_db";
final String table_name =  "Student";
final String column_name =  "name";
final String column_id =  "id";


class DatabaseStudent {

  static Database? _database;
    Future<Database> get database async {
        if (_database == null){
          _database = await initializeDatabase();
        }
        return _database!;
    }


    static DatabaseStudent? _databaseStudent;
    DatabaseStudent._createinstance();

    factory DatabaseStudent(){
      if(_databaseStudent == null){
        _databaseStudent = DatabaseStudent._createinstance();
      }
      return _databaseStudent!;
    }


    Future<Database> initializeDatabase() async {
    //     // databaseFactory = databaseFactoryFfi;
    try {
      var databasePath = await getDatabasesPath();
      String path = p.join(databasePath, database_name);
      // databaseFactory
      // = databaseFactoryFfi;
      Database database = await openDatabase(
        path, version: 1, onCreate: (Database db, int version) {
        db.execute(
            '''
              create table $table_name(
              $column_id INTEGER PRIMARY KEY,
              $column_name text not null
              )
            ''');
      },
      );
      return database;
    }
    catch (e) {
      print("database error ${e.toString()}");
      return _database!;
    }
  }



  Future<bool> AddStudent(Modelstudent modelstudent) async {
  try {
    Database db = await this.database;
    var result = await db.insert(table_name, modelstudent.toMap());
    print("${result}");
    return true;

  } catch (e)
    {
      print("Database add function ${e.toString()}");
      return false;
    }
  }

  Future<bool> UpdateStudent(Modelstudent modelstudent) async {
    try {
      Database db = await this.database;
      var result = await db.update(table_name, modelstudent.toMap(),
          where: "$column_id = ? $column_name",
          whereArgs:  [modelstudent.id]);
      print("database error ${result}");
      return true;
    } catch (e)
    {
      print("Database add function ${e.toString()}");
      return false;
    }
  }


  Future<bool> deleteStudentbyId(String id) async {
    try {
      Database db = await this.database;
      var result = await db.delete(table_name,
          where: "$column_id = ? $column_name",
          whereArgs:  [id],
    );
      print("database error ${result}");
      return true;
    } catch (e)
    {
      print("Database add function ${e.toString()}");
      return false;
    }
  }

  Future<bool> DeleteAllStudent() async {
    try {
      Database db = await this.database;
      var result = await db.delete(table_name);
      return true;
    } catch (e)
    {
      print("Database add function ${e.toString()}");
      return false  ;
    }
  }
  Future<List<Modelstudent>> GetAllStudent() async {
    List<Modelstudent> list_student = [];

      try {
      Database db = await this.database;
      List<Map<String, dynamic>> result = await db.query(table_name, orderBy: "$column_id DESC");
      if(result.length>0)
        {
          for(int i=0; i<result.length; i++)
            {
              Modelstudent modelstudent = Modelstudent.ModelObjfromMap(result[i]);
              list_student.add(modelstudent);
            }
        }

      return list_student;
    } catch (e)
    {
      print("Database add function ${e.toString()}");
      return list_student;
    }
  }
  Future<int> GetCountStudent() async {
      try {
      Database db = await this.database;
      List<Map<String, dynamic>> result = await db.query(table_name);
      return result.length;
    } catch (e)
    {
      print("Database add function ${e.toString()}");
      return 0;
    }
  }
}