import 'package:flutter/material.dart';
import 'package:pazuflata/ui/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAZU FLATA',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}
