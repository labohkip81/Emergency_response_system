import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:kdharura/model/note.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper; 
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colBlood = 'blood';
  String colHealth = 'health';
  String colDoctor = 'doctor';
  String colPriority = 'priority';

  DatabaseHelper._createInstance();
  factory DatabaseHelper (){
    if (_databaseHelper == null) {
      _databaseHelper =DatabaseHelper._createInstance();

      
    }

    return _databaseHelper;
  }
  Future<Database> get database async{
    if (_database == null) {
      _database =await initializeDatabase();
      
    }
    return _database;


  }


  Future <Database> initializeDatabase() async{
    // Get the directory path for Android to store database.
    Directory directory =await getApplicationDocumentsDirectory();
    String path =directory.path + 'notes.db';
   var notesDatabase = await openDatabase(path,version:1, onCreate:_createDb);
   return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colBlood TEXT,$colHealth TEXT, $colDoctor TEXT, $colPriority TEXT)');
  }
  // Fetch operation: Insert all note objects from database
  // Future<List<Map<String,dynamic>>>getNoteMpaList()async{
  //   Database db =await this.database;
  //   // var result =await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
  //   var result =await db.query(noteTable, orderBy: '$colPriority ASC');
  //   return result;
  // }
  // Insert operation: Insert a Note object to database
  // Future<int> insertNote(Note note) async{
  //   Database db =await this.database;
  //   var result = await db.insert(noteTable, note.toMap());
  //   return  result;


  // }
  // Update Operations: Update a Note object and save it to database
  // Future <int> updateNote(Note note) async{
  //   var db =await this.database;
  //   var result =await db.update(noteTable, note.toMap(),where: '$colId = ?', whereArgs:[note.id]);
  //   return result;
  // }
  // Delete operation : Delete a Note object from database
   Future <int> deleteNote(int id) async{
    var db =await this.database;
    int result =await db.rawDelete('DELET FROM $noteTable WHERE $colId = $id ');
    return result;
  // Get number of he nte objects in the database
  Future <int> getCount() async{
    Database db =await this.database;
    List<Map<String, dynamic>>x =await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result =Sqflite.firstIntValue(x);
    return result;
  }

}


}