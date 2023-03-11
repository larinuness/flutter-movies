import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBindigs implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(loginServices: Get.find()), fenix: true);
  }
}