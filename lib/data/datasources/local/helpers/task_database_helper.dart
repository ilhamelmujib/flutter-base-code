import 'package:tasknotes/data/models/task_model.dart';
import '../database/database_source.dart';

class TaskDatabaseHelper {
  final DatabaseSource databaseSource;

  TaskDatabaseHelper({required this.databaseSource});

  Future<void> add(TaskModel data) async {
    final db = await databaseSource.database;
    db?.insert(DatabaseSource.tblTask, data.toJson());
  }

  Future<List<Map<String, dynamic>>> fetch() async {
    final db = await databaseSource.database;
    final List<Map<String, dynamic>> results =
        await db!.query(DatabaseSource.tblTask, orderBy: "id DESC");
    return results;
  }

  Future<void> delete(int id) async {
    final db = await databaseSource.database;
    db?.rawDelete('DELETE FROM ${DatabaseSource.tblTask} WHERE id = $id');
  }

  Future<void> update(TaskModel data) async {
    final db = await databaseSource.database;
    db?.update(DatabaseSource.tblTask, data.toJson(),
        where: 'id = ?', whereArgs: [data.id]);
  }

  Future<void> updateStatus(int id, int status) async {
    final db = await databaseSource.database;
    db?.rawUpdate('UPDATE ${DatabaseSource.tblTask} SET status= $status WHERE id = $id');
  }
}
