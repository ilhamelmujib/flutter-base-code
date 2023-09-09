import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/entities/task_entity.dart';
import 'package:tasknotes/domain/repositories/task_repository.dart';
import '../../../utils/failure.dart';

class UpdateTaskUseCase {
  final TaskRepository _repository;

  UpdateTaskUseCase(this._repository);

  Future<Either<Failure, void>> execute(TaskEntity entity) {
    return _repository.updateTask(entity);
  }
}
