import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterbasecode/data/datasources/local/database/database_provider.dart';
import 'package:flutterbasecode/data/datasources/local/favorite_local_datasource.dart';
import 'package:flutterbasecode/data/datasources/remote/client/api_client.dart';
import 'package:flutterbasecode/data/datasources/remote/favorite_remote_datasource.dart';
import 'package:flutterbasecode/data/datasources/remote/movie_remote_datasource.dart';
import 'package:flutterbasecode/data/repositories/favorite_repository_impl.dart';
import 'package:flutterbasecode/data/repositories/movie_repository_impl.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Dependency {
  static Alice alice = Alice(
    showNotification: false,
    showInspectorOnShake: kDebugMode,
    darkTheme: false,
    maxCallsCount: 1000,
    notificationIcon: "@mipmap/launcher",
  );

  static init() {
    // Dio
    Get.lazyPut(
      () {
        const token =
            "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMTk2MjNhNzFjYmI4Nzk4MjlhZmE4OGQzMjNjODI5NCIsInN1YiI6IjVlNGFhNTJkOWEzYzQ5MDAxNDMxMGViNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RZ50S3wBC3Xn9KsZ8NV3rFfj-SyzbP-s5RaYv-uOfYA";
        final prettyDioLogger = PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90);
        final dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.themoviedb.org/3',
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 45),
            headers: {"Authorization": "Bearer $token"},
          ),
        );
        dio.interceptors.add(alice.getDioInterceptor());
        dio.interceptors.add(prettyDioLogger);
        return dio;
      },
      fenix: true,
    );

    // Remote
    Get.lazyPut(() => ApiClient(Get.find()), fenix: true);
    Get.lazyPut(() => MovieRemoteDataSourceImpl(Get.find()), fenix: true);
    Get.lazyPut(() => FavoriteRemoteDataSourceImpl(Get.find()), fenix: true);

    // Local
    Get.lazyPut(() => DatabaseProvider(), fenix: true);
    Get.lazyPut(() => FavoriteLocalDataSourceImpl(Get.find()), fenix: true);

    // Repositories
    Get.lazyPut(
      () => MovieRepositoryImpl(
        movieRemoteDataSource: Get.find<MovieRemoteDataSourceImpl>(),
        favoriteLocalDataSource: Get.find<FavoriteLocalDataSourceImpl>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => FavoriteRepositoryImpl(
        remoteDataSource: Get.find<FavoriteRemoteDataSourceImpl>(),
        localDataSource: Get.find<FavoriteLocalDataSourceImpl>(),
      ),
      fenix: true,
    );
  }
}
