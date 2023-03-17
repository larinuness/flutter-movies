import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../repositories/login/login_repository.dart';
import '../../repositories/login/login_repository_impl.dart';
import '../../services/login/login_service.dart';
import '../../services/login/login_services_impl.dart';
import '../auth/auth_service.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio(), fenix: true);

    //fenix deixa a instanacia sempre ativa, só morre quando fecha o app

    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);

    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);

    Get.put(AuthServices()).init();
  }
}
