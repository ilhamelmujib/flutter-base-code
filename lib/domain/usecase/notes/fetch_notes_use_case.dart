import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/entities/notes_entity.dart';
import 'package:tasknotes/domain/repositories/notes_repository.dart';
import '../../../utils/failure.dart';

class FetchNotesUseCase {
  final NotesRepository _repository;

  FetchNotesUseCase(this._repository);

  Future<Either<Failure, List<NotesEntity>>> execute() {
    return _repository.fetchNotes();
  }
}
