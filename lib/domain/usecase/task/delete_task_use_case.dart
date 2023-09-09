import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/repositories/task_repository.dart';

import '../../../utils/failure.dart';

class DeleteTaskUseCase {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<Either<Failure, void>> execute(int id) {
    return _repository.deleteTask(id);
  }
}
