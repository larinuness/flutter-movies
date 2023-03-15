import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/ui/filmes_app_ui_config.dart';
import 'modules/splash/splash_module.dart';
import 'app/bindings/app_bindings.dart';
import 'firebase_options.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

Future<void> main() async {
  //inicar o flutter antes de roda a aplicação
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseRemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesAppUiConfig.title,
      debugShowCheckedModeBanner: false,
      theme: FilmesAppUiConfig.theme,
      initialBinding: AppBindings(),
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}
