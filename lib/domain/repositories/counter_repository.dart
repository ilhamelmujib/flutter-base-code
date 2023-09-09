import 'package:flutterbasecode/domain/entities/counter_entity.dart';

abstract class CounterRepository {
  Future<CounterEntity> fetchCounter();
  Future<void> updateCounter(CounterEntity counter);
}
