import 'package:flutterbasecode/data/datasources/remote/favorite_remote_datasource.dart';
import 'package:flutterbasecode/data/models/favorite_model.dart';
import 'package:flutterbasecode/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource remoteDataSource;

  FavoriteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> toggleFavorite(FavoriteModel model) async {
      try {
        await remoteDataSource.toggleFavorite(model);
      } catch (e) {
        rethrow;
    }
  }
}
