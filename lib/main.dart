import 'package:flutter/material.dart';
import 'package:flutter_app/utils/MyRoutes.dart';
import 'pages/Home.dart';
import 'pages/Login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
       return MaterialApp(
         themeMode: ThemeMode.light,
         theme: ThemeData(
             primarySwatch: Colors.blue,
             fontFamily: GoogleFonts.lato().fontFamily
         ),
         darkTheme: ThemeData(brightness: Brightness.light),
         initialRoute: "/",
         routes: {
           "/": (context) => LoginPage(),
           MyRoutes.homePage: (context) => Home(),
           MyRoutes.loginPage: (context) => LoginPage()
         },
       );
  }

  
}
