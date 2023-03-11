import 'package:get/get.dart';

import '../../services/login/login_services.dart';

class HomeController extends GetxController {
  static const int NAVIGATOR_KEY = 1;
  static const int INDEX_PAGE_EXIT = 2;
  final LoginServices _loginServices;

  HomeController({required LoginServices loginServices})
      : _loginServices = loginServices;

}