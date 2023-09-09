import 'package:tasknotes/data/models/task_model.dart';

import '../../../utils/exception.dart';
import 'helpers/task_database_helper.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> fetchTask();
  Future<void> addTask(TaskModel task);
  Future<void> deleteTask(int id);
  Future<void> updateTask(TaskModel task);
  Future<void> updateStatusTask(int id, int status);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final TaskDatabaseHelper databaseHelper;

  TaskLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<void> addTask(TaskModel task) async {
    try {
      return await databaseHelper.add(task);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<TaskModel>> fetchTask() async {
    try {
      final result = await databaseHelper.fetch();
      return result.map((data) => TaskModel.fromJson(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    try {
      return await databaseHelper.delete(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    try {
      return await databaseHelper.update(task);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> updateStatusTask(int id, int status) async {
    try {
      return await databaseHelper.updateStatus(id, status);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
