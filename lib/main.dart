import 'package:flutter/material.dart';
import 'package:testovoe_zadanie/pages/first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Тестовое задание',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          buttonColor: Colors.orange,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
          accentColor: Colors.white,
        ),
        home: Scaffold(
          body: FirstPage(),
        )
    );
  }
}
