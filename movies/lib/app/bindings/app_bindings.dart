import '../auth/auth_service.dart';
import 'package:get/get.dart';

import '../../repositories/login/login_repository.dart';
import '../../repositories/login/login_repository_impl.dart';
import '../../services/login/login_services.dart';
import '../../services/login/login_services_impl.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    //fenix deixa a instanacia sempre ativa, só morre quando fecha o app

    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);

    Get.lazyPut<LoginService>(
        () => LoginServicesImpl(loginRepository: Get.find()),
        fenix: true);

    Get.put(AuthServices()).init();
  }
}
