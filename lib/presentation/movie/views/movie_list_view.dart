import 'package:flutter/material.dart';
import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/presentation/movie/movie_controller.dart';

class MovieListView extends GetView<MovieController> {
  final List<MovieEntity> movies;
  const MovieListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Scroll secara horizontal
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 150, // Lebar gambar film
                  height: 200, // Tinggi gambar film
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://image.tmdb.org/t/p/original${movie.posterPath}"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(movie.releaseDate),
                IconButton(
                  icon: Obx(() => Icon(
                    movie.favorite.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: movie.favorite.value ? Colors.red : null,
                  )),
                  onPressed: () {
                    movie.favorite.value = !movie.favorite.value;
                    controller.toggleFavorite(movie.id, movie.favorite.value);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
