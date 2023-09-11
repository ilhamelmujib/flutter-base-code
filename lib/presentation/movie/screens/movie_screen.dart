import 'package:flutter/material.dart';
import 'package:flutterbasecode/presentation/movie/controllers/movie_controller.dart';
import 'package:flutterbasecode/presentation/movie/views/movie_list_view.dart';
import 'package:get/get.dart';

class MovieScreen extends GetView<MovieController> {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Film'),
      ),
      body: Obx(
        () => controller.state.nowPlaying.value.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const MovieListView()
      ),
    );
  }
}
