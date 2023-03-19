import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final date = DateFormat('y');
  final MovieModel movie;
  MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 280,
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
                  child: Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
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
              onTap: () {},
              child: Card(
                  elevation: 5,
                  shape: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.grey[400],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
