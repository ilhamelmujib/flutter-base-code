import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/entities/notes_entity.dart';
import 'package:tasknotes/domain/repositories/notes_repository.dart';
import '../../../utils/failure.dart';

class UpdateNotesUseCase {
  final NotesRepository _repository;

  UpdateNotesUseCase(this._repository);

  Future<Either<Failure, void>> execute(NotesEntity entity) {
    return _repository.updateNotes(entity);
  }
}
