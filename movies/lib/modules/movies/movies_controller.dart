// ignore_for_file: avoid_print

import 'package:flutter_movies/app/auth/auth_service.dart';
import 'package:get/get.dart';

import '../../app/ui/messages/messagens_mixin.dart';
import '../../models/genre_model.dart';
import '../../models/movie_model.dart';
import '../../services/genres/genres_service.dart';
import '../../services/movies/movies_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  //Rxn pq pode ser nulo
  final genreSelected = Rxn<GenreModel>();

  MoviesController(
      {required GenresService genresService,
      required MoviesService moviesService,
      required AuthService authService})
      : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    messageListner(_message);
  }

  @override
  void onReady() async {
    super.onReady();

    try {
      final genresData = await _genresService.getGenres();

      genres.assignAll(genresData);
      await getMovies();
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da página'));
    }
  }

  Future<void> getMovies() async {
    var popularMoviesData = await _moviesService.getPopularMovies();
    var topRatedMoviesData = await _moviesService.getTopRatedMovies();
    final favorites = await getFavorites();

    popularMoviesData = popularMoviesData.map((m) {
      if (favorites.containsKey(m.id)) {
        return m.copyWith(favorite: true);
      } else {
        return m.copyWith(favorite: false);
      }
    }).toList();

    topRatedMoviesData = topRatedMoviesData.map((m) {
      if (favorites.containsKey(m.id)) {
        return m.copyWith(favorite: true);
      } else {
        return m.copyWith(favorite: false);
      }
    }).toList();

    popularMovies.assignAll(popularMoviesData);
    _popularMoviesOriginal = popularMoviesData;
    topRatedMovies.assignAll(topRatedMoviesData);
    _topRatedMoviesOriginal = topRatedMoviesData;
  }

  void filterByName(String title) {
    //filtro sem ficar acessandoo backend toda hora
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains((title.toLowerCase()));
      });

      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains((title.toLowerCase()));
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }

    genreSelected.value = genreModel;

    if (genreModel != null) {
      var newPopularMovies = _popularMoviesOriginal.where(
        (movie) {
          return movie.genres.contains(genreModel?.id);
        },
      );
      var newTopRatedMovies = _topRatedMoviesOriginal.where(
        (movie) {
          return movie.genres.contains(genreModel?.id);
        },
      );
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovies(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      final newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }
  

  //um Map pq vai pegar de um json
  Future<Map<int, MovieModel>> getFavorites() async {
    final user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoriteMovies(user.uid);
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }
    return {};
  }
}
