import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/repositories/notes_repository.dart';
import '../../../utils/failure.dart';

class DeleteNotesUseCase {
  final NotesRepository _repository;

  DeleteNotesUseCase(this._repository);

  Future<Either<Failure, void>> execute(int id) {
    return _repository.deleteNotes(id);
  }
}
