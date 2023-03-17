import 'package:get/get.dart';

import '../../app/ui/messages/messagens_mixin.dart';
import '../../models/genre_model.dart';
import '../../services/genres/genres_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();

  RxList<GenreModel> genres = <GenreModel>[].obs;
  final teste = RxList<GenreModel>();

  MoviesController({required GenresService genresService})
      : _genresService = genresService;

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
    } catch (e) {
      print(e.toString());
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar generos '));
    }
  }
}
