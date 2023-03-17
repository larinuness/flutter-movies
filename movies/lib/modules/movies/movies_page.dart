import 'package:flutter/material.dart';
import 'components/movies_filters.dart';
import 'package:get/get.dart';

import 'components/movies_header.dart';
import 'movies_controller.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: const [
          MoviesHeader(),
          MoviesFilters(),
        ],
      ),
    );
  }
}
