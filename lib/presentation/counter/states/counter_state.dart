import 'package:flutterbasecode/domain/entities/counter_entity.dart';
import 'package:get/get.dart';

class CounterState {
  final Rx<CounterEntity> counter = CounterEntity(0).obs;
  final RxBool isLoading = false.obs;
}
