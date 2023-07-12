import 'package:flutter/material.dart';
import 'package:imc_calculator/input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0a0e21),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
          centerTitle: true
        )
      ),
      title: 'Material App',
      home: InputPage(),
    );
  }
}