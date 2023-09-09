import 'package:flutterbasecode/data/datasources/local/counter_local_datasource.dart';
import 'package:flutterbasecode/data/repositories/counter_repository_impl.dart';
import 'package:get/get.dart';

class Depedency {
  static init() {
    Get.lazyPut(
        () => CounterRepositoryImpl(
              CounterLocalDataSourceImpl(),
            ),
        fenix: true);
  }
}
