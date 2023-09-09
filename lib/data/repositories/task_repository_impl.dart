import 'package:dartz/dartz.dart';
import 'package:tasknotes/data/datasources/local/task_local_data_source.dart';
import 'package:tasknotes/domain/entities/task_entity.dart';
import '../../domain/mappers/task_mapper.dart';
import '../../domain/repositories/task_repository.dart';
import '../../utils/failure.dart';
import '../../utils/exception.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskLocalDataSource localDataSource;
  final mapper = TaskMapper();

  TaskRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> addTask(TaskEntity data) async {
    try {
      final result = await localDataSource.addTask(mapper.mapToModel(data));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchTask() async {
    try {
      final result = await localDataSource.fetchTask();
      return Right(
          result.map((taskModel) => mapper.mapToEntity(taskModel)).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }


  @override
  Future<Either<Failure, void>> deleteTask(int id) async {
    try {
      final result = await localDataSource.deleteTask(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }


  @override
  Future<Either<Failure, void>> updateTask(TaskEntity data) async {
    try {
      final result = await localDataSource.updateTask(mapper.mapToModel(data));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }

  @override
  Future<Either<Failure, void>> updateStatusTask(int id, int status) async {
    try {
      final result = await localDataSource.updateStatusTask(id, status);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }

}
