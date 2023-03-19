// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../app/ui/filmes_app_ui_config.dart';
import '../../models/genre_model.dart';
import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final Dio _dio;

  GenresRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<GenreModel>> getGenres() async {
    try {
      final response = await _dio.get(
          '${FilmesAppUiConfig.baseUrl}/genre/movie/list',
          queryParameters: {
            'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
            'language': 'pt-br',
          });

      return (response.data['genres'] as List)
          .map((genre) => GenreModel.fromMap(genre))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
