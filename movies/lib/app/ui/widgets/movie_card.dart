import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../models/movie_model.dart';
import '../theme_extension.dart';

class MovieCard extends StatelessWidget {
  final date = DateFormat('y');
  final MovieModel movie;
  final VoidCallback favoriteCallback;
  MovieCard({Key? key, required this.movie, required this.favoriteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Get.toNamed(
          '/movie/detail',
          arguments: movie.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 300,
        width: 148,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image:
                            'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  date.format(DateTime.parse(movie.releaseDate)),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              right: -3,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: favoriteCallback,
                child: Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.star,
                        size: 20,
                        color: movie.favorite
                            ? context.themeOrange
                            : Colors.grey[400],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
