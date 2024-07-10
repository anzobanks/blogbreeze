import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Quickland',
    useMaterial3: false,
      brightness: Brightness.light,
 textTheme: TextTheme(
      bodyMedium:
          TextStyle(color: AppColors.main), // Couleur du texte en mode sombre
      // Ajoutez d'autres styles de texte ici
    ),
    cardColor: AppColors.grey,

    primaryColor: AppColors.white,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.background,
    primarySwatch: AppColors.createMaterialColor(AppColors.main2),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
        inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color:AppColors.grey),

        activeIndicatorBorder: BorderSide(color: AppColors.main),
        outlineBorder: BorderSide(color: AppColors.main),
        fillColor: Color(0xFFf7f8f9),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.main),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15)),
        focusColor: const Color.fromARGB(255, 244, 67, 54),
        hintStyle: const TextStyle(fontSize: 16, color: AppColors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(15)),
      ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Quickland',
    useMaterial3: false,
    canvasColor: Colors.transparent,
      brightness: Brightness.dark,
    primaryColor: AppColors.main2,
    cardColor: AppColors.background,

    scaffoldBackgroundColor: AppColors.main,
    textTheme: TextTheme(
      bodyMedium:
          TextStyle(color: Colors.white), // Couleur du texte en mode sombre
      // Ajoutez d'autres styles de texte ici
    ),
    primarySwatch: AppColors.createMaterialColor(AppColors.main2),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.main, // <-- SEE HERE
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
     inputDecorationTheme: InputDecorationTheme(
        activeIndicatorBorder: BorderSide(color: AppColors.main),
        outlineBorder: BorderSide(color: AppColors.main),
      labelStyle: TextStyle(color:AppColors.background),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.main),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15)),
        focusColor: const Color.fromARGB(255, 244, 67, 54),
        hintStyle: const TextStyle(fontSize: 16, color: AppColors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(15)),
      ),
  );
}


class AppThemes  {
  static ThemeData mainTheme = ThemeData(
      fontFamily: 'Nunito',
      useMaterial3: false,
      brightness: Brightness.light,
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.transparent),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.transparent),
      primarySwatch: AppColors.createMaterialColor(AppColors.main),
      scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.main),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              elevation: MaterialStateProperty.all(1))),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 248, 244, 244),
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          iconTheme: const MaterialStatePropertyAll(
              IconThemeData(color: AppColors.main))),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(elevation: 5),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: AppColors.main),
          elevation: 0,
          titleTextStyle: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          centerTitle: false,
          backgroundColor: Colors.transparent),
      inputDecorationTheme: InputDecorationTheme(
        activeIndicatorBorder: BorderSide(color: AppColors.main),
        outlineBorder: BorderSide(color: AppColors.main),
        fillColor: Color(0xFFf7f8f9),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.main),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15)),
        focusColor: const Color.fromARGB(255, 244, 67, 54),
        hintStyle: const TextStyle(fontSize: 16, color: AppColors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(15)),
      ),
   );

  static ThemeData darkTheme = ThemeData(
      fontFamily: 'Nunito',
      useMaterial3: false,
      brightness: Brightness.dark,
      primarySwatch: AppColors.createMaterialColor(AppColors.main),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.transparent),
      scaffoldBackgroundColor: AppColors.main,
      iconTheme: IconThemeData(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.main),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              elevation: MaterialStateProperty.all(1))),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 248, 244, 244),
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          iconTheme: const MaterialStatePropertyAll(
              IconThemeData(color: AppColors.main))),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(elevation: 5),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: AppColors.main),
          elevation: 0,
          titleTextStyle: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          centerTitle: false,
          backgroundColor: Colors.transparent),
      inputDecorationTheme: InputDecorationTheme(
        activeIndicatorBorder: BorderSide(color: AppColors.main),
        outlineBorder: BorderSide(color: AppColors.main),
      
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.main),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15)),
        focusColor: const Color.fromARGB(255, 244, 67, 54),
        hintStyle: const TextStyle(fontSize: 16, color: AppColors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(15)),
      ),
      textTheme: TextTheme(
     ));
}
