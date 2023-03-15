// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../services/login/login_services.dart';

class HomeController extends GetxController {
  static const int NAVIGATOR_KEY = 1;
  static const int INDEX_PAGE_EXIT = 2;

  final _pages = ['/movies', '/favorites'];

  final _pageIndex = 0.obs;

  final LoginService _loginService;

  //deixa como privado mesmo no construtor mas ninguem usar mesmo instanciando a classe
  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }
  }
}
