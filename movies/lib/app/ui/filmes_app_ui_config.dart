import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilmesAppUiConfig {
  //não deixa instancia a classe
  FilmesAppUiConfig._();

  static String get title => 'Filmes App';
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
              color: Color(0xFF222222),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      );
}
