import 'package:flutter/material.dart';
import 'package:flutterbasecode/presentation/counter/states/counter_state.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/presentation/counter/controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        'Counter Value: ${controller.counterState.counter.value.number}',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
