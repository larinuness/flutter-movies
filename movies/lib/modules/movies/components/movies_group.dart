import 'package:flutter/material.dart';
import '../../../app/ui/components/movie_card.dart';

class MoviesGroup extends StatelessWidget {
  final String title;
  const MoviesGroup({Key? key, required this.title}) : super(key: key);

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
            height: 280,
            child: ListView.builder(
                //recalcula toda vez que monta a lista
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const MovieCard();
                }),
          ),
        ],
      ),
    );
  }
}
