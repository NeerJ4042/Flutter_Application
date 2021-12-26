import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/Login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
       return MaterialApp(
         themeMode: ThemeMode.light,
         theme: ThemeData(
             primarySwatch: Colors.purple,
             fontFamily: GoogleFonts.lato().fontFamily
         ),
         darkTheme: ThemeData(brightness: Brightness.light),
         initialRoute: "/login",
         routes: {
           "/": (context) => LoginPage(),
           "/home": (context) => Home(),
           "/login": (context) => LoginPage()
         },
       );
  }

  
}
