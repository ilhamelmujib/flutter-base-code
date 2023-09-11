import 'package:flutter/material.dart';
import 'package:flutterbasecode/presentation/movie/intens/movie_intens.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/presentation/movie/controllers/movie_controller.dart';

class MovieListView extends GetView<MovieController> {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.state.nowPlaying.value.length,
      itemBuilder: (context, index) {
        final movie = controller.state.nowPlaying.value[index];
        return ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.releaseDate),
          trailing: IconButton(
            icon: Obx(() => Icon(
              movie.isFavorite.value
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: movie.isFavorite.value
                  ? Colors.red
                  : null, // Use red color when it's a favorite
            )),
            onPressed: () {
              movie.isFavorite.value = !movie.isFavorite.value;
              controller.intent.value = MovieIntent.toggleFavorite;
            },
          ),
        );
      },
    );
  }
}
