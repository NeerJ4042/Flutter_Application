import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/Login.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
       return MaterialApp(
         themeMode: ThemeMode.light,
         theme: ThemeData(primarySwatch: Colors.purple),
         darkTheme: ThemeData(brightness: Brightness.light),
         initialRoute: "/home",
         routes: {
           "/": (context) => LoginPage(),
           "/home": (context) => Home(),
           "/login": (context) => LoginPage()
         },
       );
  }

  
}
