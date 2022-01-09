import 'package:flutter/material.dart';
import 'package:flutter_app/utils/MyRoutes.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'pages/Login.dart';
import 'pages/Home.dart';
import 'pages/cart.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
       return MaterialApp(
         themeMode: ThemeMode.light,
         theme: MyTheme.lightTheme,
         darkTheme: MyTheme.darkTheme,
         debugShowCheckedModeBanner: false,
         //initialRoute: "/",
         routes: {
           "/": (context) => Home(),
           MyRoutes.homePage: (context) => Home(),
           MyRoutes.loginPage: (context) => LoginPage(),
           MyRoutes.cartsPage: (context) => CartPage()
         },
       );
  }

  
}
