import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../app/ui/components/movie_card.dart';

class MoviesGroup extends StatelessWidget {
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
