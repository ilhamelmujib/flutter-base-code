import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/repositories/task_repository.dart';
import '../../../utils/failure.dart';

class UpdateStatusTaskUseCase {
  final TaskRepository _repository;

  UpdateStatusTaskUseCase(this._repository);

  Future<Either<Failure, void>> execute(int id, int status) {
    return _repository.updateStatusTask(id, status);
  }
}
