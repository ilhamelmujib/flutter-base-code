import 'package:tasknotes/data/models/notes_model.dart';
import '../database/database_source.dart';

class NotesDatabaseHelper {
  final DatabaseSource databaseSource;

  NotesDatabaseHelper({required this.databaseSource});

  Future<void> add(NotesModel data) async {
    final db = await databaseSource.database;
    db?.insert(DatabaseSource.tblNotes, data.toJson());
  }

  Future<List<Map<String, dynamic>>> fetch() async {
    final db = await databaseSource.database;
    final List<Map<String, dynamic>> results =
        await db!.query(DatabaseSource.tblNotes, orderBy: "id DESC");
    return results;
  }

  Future<void> delete(int id) async {
    final db = await databaseSource.database;
    db?.rawDelete('DELETE FROM ${DatabaseSource.tblNotes} WHERE id = $id');
  }

  Future<void> update(NotesModel data) async {
    final db = await databaseSource.database;
    db?.update(DatabaseSource.tblNotes, data.toJson(),
        where: 'id = ?', whereArgs: [data.id]);
  }

  Future<void> updateFavorite(int id, int isFavorite) async {
    final db = await databaseSource.database;
    db?.rawUpdate('UPDATE ${DatabaseSource.tblNotes} SET isFavorite= $isFavorite WHERE id = $id');
  }
}
