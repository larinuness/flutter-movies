import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../app/modules/module.dart';
import 'login_binding.dart';
import 'login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/login",
      page: () => const LoginPage(),
      binding: LoginBinding(),
    )
  ];
}
