import 'package:sqflite/sqflite.dart';

class LocalDatasource {
  Database? database;

  LocalDatasource() {
    _ensureOpened();
  }

  Future<void> _ensureOpened() async {
    database ??= await openDatabase(
      'rick_and_morty.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
            CREATE TABLE favorite_characters (
              id INTEGER PRIMARY KEY,
              name TEXT,
              status TEXT,
              species TEXT,
              type TEXT,
              gender TEXT,
              origin TEXT,
              location TEXT,
              image TEXT,
              episode TEXT,
              url TEXT,
              created TEXT
            )
          ''',
        );
      },
    );
  }

  Future<void> insertCharacter(Map<String, dynamic> character) async {
    await _ensureOpened();
    await database?.insert(
      'favorite_characters',
      character,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getCharacters() async {
    await _ensureOpened();
    return await database!.query('favorite_characters');
  }

  Future<void> deleteCharacter(int id) async {
    await _ensureOpened();

    await database?.delete(
      'favorite_characters',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllCharacters() async {
    await _ensureOpened();
    await database?.delete('favorite_characters');
  }

  Future<bool> isFavoriteCharacter(int id) async {
    await _ensureOpened();

    final result = await database?.query(
      'favorite_characters',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result!.isNotEmpty;
  }

  Future<void> closeDatabase() async {
    await database?.close();
  }
}
