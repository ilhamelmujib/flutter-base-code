import 'package:dartz/dartz.dart';
import 'package:tasknotes/domain/repositories/notes_repository.dart';
import '../../../utils/failure.dart';

class UpdateFavoriteNotesUseCase {
  final NotesRepository _repository;

  UpdateFavoriteNotesUseCase(this._repository);

  Future<Either<Failure, void>> execute(int id, int isFavorite) {
    return _repository.updateFavoriteNotes(id, isFavorite);
  }
}
