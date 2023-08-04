import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/ui/widgets/movie_card.dart';
import 'favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() => SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: controller.movies
                    .map(
                      (movie) => MovieCard(
                        movie: movie,
                        favoriteCallback: () => controller.removeFavorites(
                          movie,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )),
    );
  }
}
