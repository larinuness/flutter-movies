import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashBiding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
