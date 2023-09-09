import 'package:flutterbasecode/domain/entities/counter_entity.dart';
import 'package:flutterbasecode/presentation/counter/intens/counter_intens.dart';
import 'package:flutterbasecode/presentation/counter/states/counter_state.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/domain/usecases/counter_usecase.dart';

class CounterController extends GetxController {
  final CounterUseCase _counterUseCase;

  CounterController(this._counterUseCase);

  final CounterState counterState = CounterState();
  final Rx<CounterIntent> counterIntent = CounterIntent.none.obs;

  @override
  void onInit() {
    super.onInit();
    _handleIntent();
  }

  void _handleIntent() {
    counterIntent.listen((intent) {
      switch (intent) {
        case CounterIntent.increment:
          _updateCounter(1);
        case CounterIntent.decrement:
          _updateCounter(-1);
        default:
          break;
      }

    });
  }

  void _updateCounter(int amount) async {
    final counter = counterState.counter.value.number + amount;
    counterState.counter.value = CounterEntity(counter);
    await _counterUseCase.updateCounter(counter);
    counterIntent.value = CounterIntent.none;
  }
}
