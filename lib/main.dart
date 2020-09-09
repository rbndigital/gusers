import 'package:flutter/material.dart';
import 'package:gusers/pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'G Users',
      home: HomePage(),
    );
  }
}
