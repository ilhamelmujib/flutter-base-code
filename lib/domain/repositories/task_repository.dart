import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> fetchTask();
  Future<Either<Failure, void>> addTask(TaskEntity data);
  Future<Either<Failure, void>> deleteTask(int id);
  Future<Either<Failure, void>> updateTask(TaskEntity data);
  Future<Either<Failure, void>> updateStatusTask(int id, int status);
}
