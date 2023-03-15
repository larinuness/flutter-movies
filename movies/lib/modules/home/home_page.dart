import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../favorites/favorites_page.dart';
import '../movies/movies_page.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.purple[300],
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Filmes',
              icon: Icon(Icons.movie),
            ),
            BottomNavigationBarItem(
              label: 'Favoritos',
              icon: Icon(Icons.star),
            ),
            BottomNavigationBarItem(
              label: 'Sair',
              icon: Icon(Icons.logout),
            ),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: ((settings) {
          if (settings.name == "/movies") {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
            );
          }
          if (settings.name == "/favorites") {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
            );
          }
          return null;
        }),
      ),
    );
  }
}
