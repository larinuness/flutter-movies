// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/ui/loader/loader_mixin.dart';
import '../../app/ui/messages/messagens_mixin.dart';
import '../../services/login/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loaderRx = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginServices,
  }) : _loginService = loginServices;

  @override
  void onInit() {
    super.onInit();
    loaderListner(loaderRx);
    messageListner(message);
  }

  Future<void> login(context) async {
    try {
      loaderRx(true);

      await _loginService.login();
      loaderRx(false);
      // message(MessageModel.info(
      //     title: "Sucesso", message: "Login Realizado Com Sucesso"));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: const Text(
            'Login realizado com sucesso',
          ),
        ),
      );
    } catch (e, s) {
      print(e);
      print(s);
      loaderRx(false);
      message(MessageModel.error(title: "Erro", message: "Erro no login"));
    }
  }
}
