// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../app/ui/filmes_app_ui_config.dart';
import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final Dio _dio;

  MoviesRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await _dio
          .get('${FilmesAppUiConfig.baseUrl}/movie/popular', queryParameters: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      });

      return (response.data['results'] as List)
          .map((movie) => MovieModel.fromMap(movie))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await _dio.get(
        '${FilmesAppUiConfig.baseUrl}/movie/top_rated',
        queryParameters: {
          'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
          'language': 'pt-br',
          'page': '1',
        },
      );

      return (response.data['results'] as List)
          .map((movie) => MovieModel.fromMap(movie))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  @override
  Future<MovieDetailModel?> getMovieDetail(int id) async {
    try {
      final response = await _dio.get(
        '${FilmesAppUiConfig.baseUrl}/movie/$id',
        queryParameters: {
          'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
          'language': 'pt-br',
          //manda como parametro
          'append_to_response': 'images,credits',
          //acha as imagens em ingles e pt
          'include_image_language': 'en,pt-br',
        },
      );

      return MovieDetailModel.fromMap(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      final favoriteCollection = FirebaseFirestore.instance
          //coleção de favoritos
          .collection('favorites')
          //dentro dela tem o id do user logado
          .doc(userId)
          //dentro da coloção tem outra pq um user pode ter varios filmes como fav
          .collection('movies');

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        final favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();

        //deleta o primeiro ja que só tem 1
        favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      print('Erro ao favoritar um filme');
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoriteMovies(String userId) async {
    final favoriteMovies = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('movies')
        .get();

    final listFavorites = <MovieModel>[];
    for (var movie in favoriteMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }

    return listFavorites;
  }
}
