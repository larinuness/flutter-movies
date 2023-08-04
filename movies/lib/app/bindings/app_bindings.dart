import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../repositories/login/login_repository.dart';
import '../../repositories/login/login_repository_impl.dart';
import '../../repositories/movies/movies_repository.dart';
import '../../repositories/movies/movies_repository_impl.dart';
import '../../services/login/login_service.dart';
import '../../services/login/login_service_impl.dart';
import '../../services/movies/movies_service.dart';
import '../../services/movies/movies_service_impl.dart';
import '../auth/auth_service.dart';

class AppBindings implements Bindings {
  //fica nessa classe tudo o que usa em mais de um lugar
  @override
  void dependencies() {
    Get.lazyPut(() => Dio(), fenix: true);

    //fenix deixa a instanacia sempre ativa, só morre quando fecha o app

    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);

    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);

    Get.lazyPut<MoviesRepository>(() => MoviesRepositoryImpl(dio: Get.find()),
        fenix: true);

    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(
              moviesRepository: Get.find(),
            ),
        fenix: true);

    Get.put(AuthService()).init();
  }
}
