import 'package:flutter/material.dart';
import 'package:petli/circle/circle.dart';
import 'package:petli/triangle/triangle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff5c3c61),
            title: const Text(
              'Petli Assignment 🐶',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: const Circle()),
    );
  }
}
