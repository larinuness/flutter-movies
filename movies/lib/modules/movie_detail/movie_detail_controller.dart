import 'package:get/get.dart';

import '../../app/ui/loader/loader_mixin.dart';
import '../../app/ui/messages/messagens_mixin.dart';
import '../../models/movie_detail_model.dart';
import '../../services/movies/movies_service.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;
  final loading = false.obs;
  final _message = Rxn<MessageModel>();
  final movie = Rxn<MovieDetailModel>();

  MovieDetailController({required MoviesService movieService})
      : _moviesService = movieService;

  @override
  void onInit() {
    super.onInit();
    loaderListner(loading);
    messageListner(_message);
  }

  @override
  void onReady() async {
    super.onReady();

    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesService.getMovieDetail(movieId);
      movie.value = movieDetailData;
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da página'));
    }
  }
}
