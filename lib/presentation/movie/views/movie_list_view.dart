import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/presentation/movie/controllers/movie_controller.dart';

class MovieListView extends GetView<MovieController> {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.state.movies.value.length,
      itemBuilder: (context, index) {
        final movie = controller.state.movies.value[index];
        return ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.releaseDate),
        );
      },
    );
  }
}
