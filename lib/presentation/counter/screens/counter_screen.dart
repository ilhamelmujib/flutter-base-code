import 'package:flutter/material.dart';
import 'package:flutterbasecode/presentation/counter/intens/counter_intens.dart';
import 'package:flutterbasecode/presentation/counter/views/counter_view.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/presentation/counter/controllers/counter_controller.dart';

class CounterScreen extends GetView<CounterController> {

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: const Center(
        child: CounterView()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.counterIntent.value = CounterIntent.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
