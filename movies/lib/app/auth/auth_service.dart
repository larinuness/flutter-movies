import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';


//GetxService fica sempre ativa e só morre quando fechao o app
class AuthServices extends GetxService {
  User? user;

  void init() {
    //authStateChanges retorna uma stream
    //escuta as alterações
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
