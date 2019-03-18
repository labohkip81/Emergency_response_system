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
}