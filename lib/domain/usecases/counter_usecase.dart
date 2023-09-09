import 'package:flutterbasecode/domain/entities/counter_entity.dart';
import 'package:flutterbasecode/domain/repositories/counter_repository.dart';

class CounterUseCase {
  final CounterRepository _repository;

  CounterUseCase(this._repository);

  Future<CounterEntity> fetchCounter() {
    return _repository.fetchCounter();
  }

  Future<void> updateCounter(int value) {
    final counterEntity = CounterEntity(value);
    return _repository.updateCounter(counterEntity);
  }
}
