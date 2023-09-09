import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/entities/task_entity.dart';
import 'package:tasknotes/domain/repositories/task_repository.dart';

import '../../../utils/failure.dart';

class FetchTaskUseCase {
  final TaskRepository _repository;

  FetchTaskUseCase(this._repository);

  Future<Either<Failure, List<TaskEntity>>> execute() {
    return _repository.fetchTask();
  }
}
