import 'package:tasknotes/data/datasources/local/helpers/notes_database_helper.dart';
import 'package:tasknotes/data/models/notes_model.dart';
import '../../../utils/exception.dart';

abstract class NotesLocalDataSource {
  Future<List<NotesModel>> fetchNotes();
  Future<void> addNotes(NotesModel task);
  Future<void> deleteNotes(int id);
  Future<void> updateNotes(NotesModel task);
  Future<void> updateFavoriteNotes(int id, int status);
}

class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  final NotesDatabaseHelper databaseHelper;

  NotesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<void> addNotes(NotesModel task) async {
    try {
      return await databaseHelper.add(task);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<NotesModel>> fetchNotes() async {
    try {
      final result = await databaseHelper.fetch();
      return result.map((data) => NotesModel.fromJson(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> deleteNotes(int id) async {
    try {
      return await databaseHelper.delete(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> updateNotes(NotesModel task) async {
    try {
      return await databaseHelper.update(task);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> updateFavoriteNotes(int id, int status) async {
    try {
      return await databaseHelper.updateFavorite(id, status);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
