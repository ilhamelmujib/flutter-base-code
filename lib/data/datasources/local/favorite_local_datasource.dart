import 'package:flutterbasecode/data/models/favorite_model.dart';
import 'package:flutterbasecode/data/datasources/local/database/database_provider.dart';

abstract class FavoriteLocalDataSource {
  Future<void> toggleFavorite(FavoriteModel model);
  Future<bool> isFavorite(String mediaType, int mediaId);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final DatabaseProvider databaseProvider;

  FavoriteLocalDataSourceImpl(this.databaseProvider);

  @override
  Future<void> toggleFavorite(FavoriteModel model) async {
    final db = await databaseProvider.database;
    try {
      final isExistingFavorite = await isFavorite(model.mediaType, model.mediaId);

      if (isExistingFavorite) {
        await db.update(
          'favorites',
          model.toJson(),
          where: 'media_type = ? AND media_id = ?',
          whereArgs: [model.mediaType, model.mediaId],
        );
      } else {
        await db.insert('favorites', model.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isFavorite(String mediaType, int mediaId) async {
    final db = await databaseProvider.database;
    try {
      final maps = await db.query(
        'favorites',
        where: 'media_type = ? AND media_id = ?',
        whereArgs: [mediaType, mediaId],
      );

      return maps.isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }
}
