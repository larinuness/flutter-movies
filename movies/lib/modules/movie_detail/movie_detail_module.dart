import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../app/modules/module.dart';
import 'movie_detail_bindings.dart';
import 'movie_detail_page.dart';

class MovieDetailModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => const MovieDetailPage(),
      binding: MovieDetailBindings(),
    ),
  ];
}
