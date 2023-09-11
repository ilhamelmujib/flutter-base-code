import 'package:dio/dio.dart';
import 'package:flutterbasecode/data/datasources/remote/client/api_service.dart';
import 'package:flutterbasecode/data/datasources/remote/favorite_remote_datasource.dart';
import 'package:flutterbasecode/data/datasources/remote/movie_remote_datasource.dart';
import 'package:flutterbasecode/data/repositories/favorite_repository_impl.dart';
import 'package:flutterbasecode/data/repositories/movie_repository_impl.dart';
import 'package:get/get.dart';

class Dependency {
  static const token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMTk2MjNhNzFjYmI4Nzk4MjlhZmE4OGQzMjNjODI5NCIsInN1YiI6IjVlNGFhNTJkOWEzYzQ5MDAxNDMxMGViNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RZ50S3wBC3Xn9KsZ8NV3rFfj-SyzbP-s5RaYv-uOfYA";
  static init() {

    // Dio
    Get.lazyPut(
      () => Dio(BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 45),
          headers: {"Authorization": "Bearer $token"})),
      fenix: true,
    );

    // ApiService
    Get.lazyPut(() => ApiService(Get.find()), fenix: true);

    // Repositories
    Get.lazyPut(
      () => MovieRepositoryImpl(
          remoteDataSource: MovieRemoteDataSourceImpl(Get.find())),
      fenix: true,
    );
    Get.lazyPut(
      () => FavoriteRepositoryImpl(
          remoteDataSource: FavoriteRemoteDataSourceImpl(Get.find())),
      fenix: true,
    );

  }
}
