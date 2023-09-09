import 'package:dartz/dartz.dart';
import 'package:tasknotes/data/datasources/local/notes_local_data_source.dart';
import 'package:tasknotes/domain/repositories/notes_repository.dart';
import '../../domain/entities/notes_entity.dart';
import '../../domain/mappers/notes_mapper.dart';
import '../../utils/failure.dart';
import '../../utils/exception.dart';

class NotesRepositoryImpl extends NotesRepository {
  final NotesLocalDataSource localDataSource;
  final mapper = NotesMapper();

  NotesRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> addNotes(NotesEntity data) async {
    try {
      final result = await localDataSource.addNotes(mapper.mapToModel(data));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }

  @override
  Future<Either<Failure, List<NotesEntity>>> fetchNotes() async {
    try {
      final result = await localDataSource.fetchNotes();
      return Right(
          result.map((notesModel) => mapper.mapToEntity(notesModel)).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }


  @override
  Future<Either<Failure, void>> deleteNotes(int id) async {
    try {
      final result = await localDataSource.deleteNotes(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }


  @override
  Future<Either<Failure, void>> updateNotes(NotesEntity data) async {
    try {
      final result = await localDataSource.updateNotes(mapper.mapToModel(data));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }

  @override
  Future<Either<Failure, void>> updateFavoriteNotes(int id, int isFavorite) async {
    try {
      final result = await localDataSource.updateFavoriteNotes(id, isFavorite);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(UnknownError("Something wrong"));
    }
  }

}
