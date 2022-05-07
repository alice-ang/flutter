import 'package:flutter/material.dart';
import 'package:petli/circle/circle.dart';
import 'package:petli/triangle/triangle.dart';

class Shape extends StatefulWidget {
  const Shape({Key? key}) : super(key: key);

  @override
  State<Shape> createState() => _ShapeState();
}

class _ShapeState extends State<Shape> {
  List<Widget> shapes = <Widget>[
    const Circle(),
    const Circle(),
    const Triangle()
  ];

  final c1 = const Circle();
  static const c2 = Circle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        c1,
      ],
    );
  }
}
