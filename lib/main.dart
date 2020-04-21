import 'package:dice20/mainpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyDice());

class MyDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
