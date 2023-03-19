import 'package:get/get.dart';

import '../../repositories/genres/genres_repository.dart';
import '../../repositories/genres/genres_repository_impl.dart';
import '../../services/genres/genres_service.dart';
import '../../services/genres/genres_service_impl.dart';
import 'movies_controller.dart';

class MoviesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(dio: Get.find()),
    );

    Get.lazyPut(
      () => MoviesController(
          genresService: Get.find(), moviesService: Get.find()),
    );

    Get.lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepository: Get.find()));
  }
}
