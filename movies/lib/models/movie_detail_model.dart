import 'cast_model.dart';
import 'genre_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;
  MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPoster = map['images']['posters'];
    var urlImages = urlImagesPoster
            ?.map<String>((images) =>
                'https://image.tmdb.org/t/p/w200${images['file_path']}')
            .toList() ??
        const [];

    return MovieDetailModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0.0,
      genres: List<GenreModel>.from(
        map['genres']?.map(
              (genre) => GenreModel.fromMap(genre),
            ) ??
            const [],
      ),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies: List<dynamic>.from(
        map['production_companies'] ?? const [],
      ).map<String>((production) => production['name']).toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(
        map['credits']['cast']?.map((credit) => CastModel.fromMap(credit)) ??
            const [],
      ),
    );
  }
}
