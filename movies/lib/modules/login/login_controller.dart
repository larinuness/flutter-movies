// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../app/ui/loader/loader_mixin.dart';
import '../../app/ui/messages/messagens_mixin.dart';
import '../../services/login/login_services.dart';

class LoginController extends GetxController with LoaderMixin, MessagensMixin {
  final LoginServices _loginService;
  final loaderRx = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginServices loginServices,
  }) : _loginService = loginServices;

  @override
  void onInit() {
    super.onInit();
    loaderListner(loaderRx);
    messageListner(message);
  }

  Future<void> login() async {
    try {
      loaderRx(true);

      await _loginService.login();
      loaderRx(false);
      message(MessageModel.info(
          title: "Sucesso", message: "Login Realizado Com Sucesso"));
    } catch (e, s) {
      print(e);
      print(s);
      loaderRx(false);
      message(MessageModel.error(title: "Erro", message: "Erro no login"));
    }
  }
}
