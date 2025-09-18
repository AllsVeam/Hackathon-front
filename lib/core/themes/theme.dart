import 'package:flutter/material.dart';

// TODO: Revisar paleta de colores que puedan corresponder al tema claro
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  primaryColorLight: Colors.black,
  primaryColorDark: Colors.white,
  cardColor: Color.fromARGB(181, 64, 195, 255),
);

// TODO: Revisar paleta de colores que puedan corresponder al tema oscuro
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromARGB(255, 53, 53, 53),
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,
  cardColor: Color.fromARGB(255, 53, 53, 53),
);
