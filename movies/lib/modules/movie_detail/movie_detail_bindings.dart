import 'package:get/get.dart';

import 'movie_detail_controller.dart';

class MovieDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailController(movieService: Get.find()));
  }
}
