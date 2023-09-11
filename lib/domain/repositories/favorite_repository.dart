import 'package:flutterbasecode/data/models/favorite_model.dart';

abstract class FavoriteRepository {
  Future<void> toggleFavorite(FavoriteModel model);
}
