import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';
import '../../repositories/movies/movies_repository.dart';
import 'movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;

  MoviesServiceImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() async =>
      await _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRatedMovies() async =>
      await _moviesRepository.getTopRatedMovies();

  @override
  Future<MovieDetailModel?> getMovieDetail(int id) async =>
      await _moviesRepository.getMovieDetail(id);
}
