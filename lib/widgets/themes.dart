import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
 static ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light, 
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: darkBluishColor),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkBluishColor),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        toolbarTextStyle: TextTheme().bodyMedium,
        titleTextStyle: TextTheme().titleLarge,
      ),
    );


        static ThemeData get darkTheme => ThemeData(
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.poppins().fontFamily,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: lightBluishColor),
  ),
  canvasColor: darkCreamColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: lightBluishColor),
  ),
  colorScheme: ColorScheme.dark( 
    secondary: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.black,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
    toolbarTextStyle: TextTheme().bodyMedium,
    titleTextStyle: TextTheme().titleLarge,
  ),
);


        static Color creamColor = Color(0xffe0f7fa);
         static Color darkCreamColor = Vx.gray900;
        static Color darkBluishColor = Color(0xff403b58);
        static Color lightBluishColor = Vx.indigo500;
}