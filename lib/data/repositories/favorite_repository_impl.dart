import 'package:flutterbasecode/data/datasources/local/favorite_local_datasource.dart';
import 'package:flutterbasecode/data/datasources/remote/favorite_remote_datasource.dart';
import 'package:flutterbasecode/data/models/favorite_model.dart';
import 'package:flutterbasecode/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource remoteDataSource;
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<void> toggleFavorite(FavoriteModel model) async {
    try {
        await remoteDataSource.toggleFavorite(model);
        await localDataSource.toggleFavorite(model);
    } catch (e) {
        rethrow;
    }
  }
}
