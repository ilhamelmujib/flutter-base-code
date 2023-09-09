import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/entities/notes_entity.dart';
import '../../utils/failure.dart';

abstract class NotesRepository {
  Future<Either<Failure, List<NotesEntity>>> fetchNotes();
  Future<Either<Failure, void>> addNotes(NotesEntity data);
  Future<Either<Failure, void>> deleteNotes(int id);
  Future<Either<Failure, void>> updateNotes(NotesEntity data);
  Future<Either<Failure, void>> updateFavoriteNotes(int id, int isFavorite);
}
