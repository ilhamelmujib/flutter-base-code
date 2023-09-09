import 'package:flutterbasecode/domain/entities/counter_entity.dart';
import 'package:flutterbasecode/data/models/counter_model.dart';

class CounterMapper {
  static CounterEntity fromModel(CounterModel model) {
    return CounterEntity(model.number);
  }

  static CounterModel toModel(CounterEntity entity) {
    return CounterModel(null, entity.number);
  }
}
