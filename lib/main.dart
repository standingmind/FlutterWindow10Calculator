import './screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      home: CalcHome(),
    );
  }
}
