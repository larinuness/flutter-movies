import 'package:get/get.dart';

import '../../app/auth/auth_service.dart';

class SplashController extends GetxController {
  
  @override
  Future<void> onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 3));
    Get.put(AuthServices()).init();
  }
}