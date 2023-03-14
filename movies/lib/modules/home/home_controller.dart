// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../services/login/login_services.dart';

class HomeController extends GetxController {
  static const int NAVIGATOR_KEY = 1;
  static const int INDEX_PAGE_EXIT = 2;

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == 1) {
      Get.offNamed('/favorites', id: 1);
    }
    if (page == 0) {
      Get.offNamed('/movies', id: 1);
    }
  }
}
