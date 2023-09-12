import 'package:flutter/material.dart';
import 'package:flutterbasecode/presentation/movie/movie_controller.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("NOW PLAYING"),
            ),
            Obx(() => controller.state.nowPlaying.value.isEmpty
                ? const CircularProgressIndicator()
                : MovieListView(
                    movies: controller.state.nowPlaying.value,
                  )),
            const Text("POPULAR"),
            Obx(() => controller.state.popular.value.isEmpty
                ? const CircularProgressIndicator()
                : MovieListView(
                    movies: controller.state.popular.value,
                  )),
          ],
        ),
      ),
    );
  }
}
