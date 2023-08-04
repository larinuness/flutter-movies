import 'package:flutter/material.dart';

import '../../../../models/movie_detail_model.dart';
import 'movie_detail_content_casters.dart';
import 'movie_detail_content_company.dart';
import 'movie_detail_content_credits.dart';
import 'movie_detail_content_title.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movie: movie),
        MovieDetailContentCredits(movie: movie),
        MovieDetailContentCompany(movie: movie),
        MovieDetailContentCasters(movie: movie)
      ],
    );
  }
}
