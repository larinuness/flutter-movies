import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../app/ui/widgets/movie_card.dart';
import '../../../models/movie_model.dart';
import '../movies_controller.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String title;
  final List<MovieModel> movies;
  const MoviesGroup({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 300,
            child: Obx(
              () {
                return ListView.builder(
                  //recalcula toda vez que monta a lista
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: movies[index],
                      favoriteCallback: () =>
                          controller.favoriteMovies(movies[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
