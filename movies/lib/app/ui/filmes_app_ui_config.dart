import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilmesAppUiConfig {
  //não deixa instancia a classe
  FilmesAppUiConfig._();

  static Color blackPrimary = const Color(0xFF222222);

  static String baseUrl = 'https://api.themoviedb.org/3';

  static String get title => 'Filmes App';
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
              color: blackPrimary, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      );
}
