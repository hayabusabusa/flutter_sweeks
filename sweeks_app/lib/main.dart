import 'package:flutter/material.dart';
import 'package:sweeks_app/screens/screens.dart';

void main() {
  runApp(SweeksApp());
}

class SweeksApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweeks',
      home: TestScreen(),
    );
  }
}