import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData get lightTheme => ThemeData(
  primarySwatch: Colors.blue,
  fontFamily: GoogleFonts.lato().fontFamily,
  appBarTheme: AppBarTheme(
  color: Colors.white,
  elevation: 0.0,
  iconTheme: IconThemeData(color: Colors.black),
   )
  );

  static ThemeData get darkTheme => ThemeData(
     brightness: Brightness.dark
  );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}