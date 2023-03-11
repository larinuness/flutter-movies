import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class AuthServices extends GetxService {
  User? user;

  void init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      this.user = user;

      if (user == null) {
        Get.offAllNamed("/login");
      } else {
        Get.offAllNamed("/home");
      }
    });
  }
}
