import 'package:flutter/material.dart';
import 'package:project_management/app/constans/app_constants.dart';

/// all custom application theme
class AppTheme {
  /// default application theme
  static ThemeData get basic => ThemeData(
        fontFamily: Font.poppins,
        primaryColorDark: const Color.fromARGB(255, 0, 0, 0),
        primaryColor: const Color.fromARGB(255, 109, 197, 255),
        primaryColorLight: const Color.fromARGB(255, 67, 178, 252),
        brightness: Brightness.dark,
        primaryColorBrightness: Brightness.dark,
        primarySwatch: Colors.cyan,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 67, 178, 252),
        ).merge(
          ButtonStyle(elevation: MaterialStateProperty.all(0)),
        )),
        canvasColor: const Color.fromARGB(255, 254, 254, 255),
        cardColor: const Color(0xffCFBDF8),
      );

  // you can add other custom theme in this class like  light theme, dark theme ,etc.

  // example :
  // static ThemeData get light => ThemeData();

  // static ThemeData get dark => ThemeData();
}



      //   static ThemeData get basic => ThemeData(
      //   fontFamily: Font.poppins,
      //   primaryColorDark: Color.fromARGB(255, 250, 250, 250),
      //   primaryColor: Color.fromARGB(255, 109, 197, 255),
      //   primaryColorLight: Color.fromARGB(255, 67, 178, 252),
      //   brightness: Brightness.dark,
      //   primaryColorBrightness: Brightness.dark,
      //   primarySwatch: Colors.cyan,
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //       style: ElevatedButton.styleFrom(
      //     primary: Color.fromARGB(255, 255, 255, 255),
      //   ).merge(
      //     ButtonStyle(elevation: MaterialStateProperty.all(0)),
      //   )),
      //   canvasColor: const Color.fromRGBO(31, 29, 44, 1),
      //   cardColor: const Color.fromRGBO(38, 40, 55, 1),
      // );


        /// default application theme
  // static ThemeData get basic => ThemeData(
  //       fontFamily: Font.poppins,
  //       primaryColorDark: const Color.fromRGBO(111, 88, 255, 1),
  //       primaryColor: const Color.fromRGBO(128, 109, 255, 1),
  //       primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
  //       brightness: Brightness.dark,
  //       primaryColorBrightness: Brightness.dark,
  //       primarySwatch: Colors.deepPurple,
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //         primary: const Color.fromRGBO(128, 109, 255, 1),
  //       ).merge(
  //         ButtonStyle(elevation: MaterialStateProperty.all(0)),
  //       )),
  //       canvasColor: const Color.fromRGBO(31, 29, 44, 1),
  //       cardColor: const Color.fromRGBO(38, 40, 55, 1),
  //     );