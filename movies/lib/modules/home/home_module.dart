import 'package:flutter_movies/modules/home/home_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../app/modules/module.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(name: "/home", page: () => const HomePage(), binding: HomeBindigs())
  ];
}
