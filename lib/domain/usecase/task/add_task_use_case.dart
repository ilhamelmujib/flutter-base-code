import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/entities/task_entity.dart';
import 'package:tasknotes/domain/repositories/task_repository.dart';

import '../../../utils/failure.dart';

class AddTaskUseCase {
  final TaskRepository _repository;

  AddTaskUseCase(this._repository);

  Future<Either<Failure, void>> execute(TaskEntity entity) {
    return _repository.addTask(entity);
  }
}
