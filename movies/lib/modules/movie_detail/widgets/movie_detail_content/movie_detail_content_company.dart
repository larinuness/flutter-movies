import 'package:flutter/material.dart';

import '../../../../models/movie_detail_model.dart';

class MovieDetailContentCompany extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContentCompany({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
            text: 'Companhias(s) produtora(s): ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF222222),
            ),
            children: [
              TextSpan(
                text: movie?.productionCompanies.join(', ') ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF222222),
                ),
              )
            ]),
      ),
    );
  }
}
