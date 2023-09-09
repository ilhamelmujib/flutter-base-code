import 'package:flutterbasecode/data/models/counter_model.dart';

abstract class CounterLocalDataSource {
  Future<CounterModel> getCounter();
  Future<void> saveCounter(CounterModel counter);
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  @override
  Future<CounterModel> getCounter() async {
    // Implement logic to retrieve counter data from local storage
    // For example, you can use shared preferences or SQLite
    // Return a CounterModel instance based on the stored data
    return CounterModel(1, 1);
  }

  @override
  Future<void> saveCounter(CounterModel counter) async {
    // Implement logic to save counter data to local storage
    // For example, you can use shared preferences or SQLite
    // Save the counter value from the CounterModel
    print("SAVED");
  }
}
