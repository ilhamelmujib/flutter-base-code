import 'package:flutterbasecode/data/models/favorite_model.dart';
import 'package:flutterbasecode/domain/repositories/favorite_repository.dart';

class ToggleFavoriteUseCase {
  final FavoriteRepository repository;

  ToggleFavoriteUseCase(this.repository);

  Future<void> execute(FavoriteModel model) async {
    return await repository.toggleFavorite(model);
  }
}
