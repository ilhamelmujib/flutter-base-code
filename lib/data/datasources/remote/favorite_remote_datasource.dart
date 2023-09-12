import 'package:flutterbasecode/data/datasources/remote/client/api_client.dart';
import 'package:flutterbasecode/data/models/response_model.dart';
import 'package:flutterbasecode/data/models/favorite_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<void> toggleFavorite(FavoriteModel model);
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiClient apiService;

  FavoriteRemoteDataSourceImpl(this.apiService);

  @override
  Future<void> toggleFavorite(FavoriteModel model) async {
    try {
      final response = await apiService.post(
        '/account/9061926/favorite',
        model.toJson(),
      );
      final data = ResponseModel.fromJson(response, (data) => data);
      if (!data.success) {
        throw Exception(data.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
