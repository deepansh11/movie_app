import 'dart:io';

import 'package:movie_app/Models/movies_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBmovies {
  static Database? _database;
  static final DBmovies db = DBmovies._();

  DBmovies._();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory moviesDirectory = await getApplicationDocumentsDirectory();

    final path = join(moviesDirectory.path, 'movie.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      await db.execute('CREATE TABLE Movies('
          'id INTEGER PRIMARY KEY UNIQUE,'
          'title TEXT,'
          'poster_path TEXT,'
          'backdrop_path TEXT,'
          'popularity REAL,'
          'release_date TEXT,'
          'overview TEXT'
          ')');
    });
  }

  Future<List<Map>> findObjects(String query) async {
    final db = await database;
    final ret = await db!
        .rawQuery('SELECT * FROM Movies where title like ?', ['%$query%']);

    print(ret);
    return ret;
  }

  createMovie(MovieModel newMovie) async {
    final db = await database;
    final res = await db!.insert('Movies', newMovie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<List<MovieModel>> getAllMovies() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Movies");

    List<MovieModel> list;
    if (res.isNotEmpty) {
      list = res.map((e) => MovieModel.fromMap(e)).toList();
    } else {
      list = [];
    }

    return list;
  }
}
