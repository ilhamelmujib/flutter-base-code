import 'package:flutterbasecode/data/datasources/local/counter_local_datasource.dart';
import 'package:flutterbasecode/domain/entities/counter_entity.dart';
import 'package:flutterbasecode/domain/mappers/counter_mapper.dart';
import 'package:flutterbasecode/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource; // Add this variable

  CounterRepositoryImpl(this.localDataSource);

  @override
  Future<CounterEntity> fetchCounter() async {
      final counterModel = await localDataSource.getCounter();
    return CounterMapper.fromModel(counterModel);
  }

  @override
  Future<void> updateCounter(CounterEntity counter) async {
    final counterModel = CounterMapper.toModel(counter);
    await localDataSource.saveCounter(counterModel);
  }
}
