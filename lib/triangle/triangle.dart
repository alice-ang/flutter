import 'package:flutter/material.dart';

import 'package:petli/line/line_painter.dart';
import 'package:petli/circle/circle_painter.dart';
import 'package:petli/triangle/triangle_painter.dart';

class Triangle extends StatefulWidget {
  const Triangle({Key? key}) : super(key: key);

  @override
  State<Triangle> createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
  static Offset newPosition = const Offset(10, 10);
  static bool _isDragged = false;
  static const arr = <Offset>[];

  var circle = CirclePainter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onPanStart: (DragStartDetails dragStartDetails) {
            setState(() {
              _isDragged = true;
            });
          },
          onPanEnd: (DragEndDetails dragEndDetails) {
            setState(() {
              _isDragged = false;
            });
          },
          onPanUpdate: (details) => {print(details.globalPosition)},
          child: Container(
            height: 300,
            width: 300,
            color: Colors.yellow,
            child: CustomPaint(painter: TrianglePainter()),
          )),
    );
  }

  void _onPanUpdate(DragUpdateDetails details, BuildContext context) {
    print(details.globalPosition);
    setState(() {
      newPosition = details.globalPosition;
    });
  }
}

// class TrianglePainter extends CustomPainter {
//   TrianglePainter(this.shape);
//   final Rect shape;

//   @override
//   void paint(Canvas canvas, Size size) {
//     var path = Path();
//     path.moveTo(size.width / 2, 0);
//     path.lineTo(0, size.height);
//     path.lineTo(size.height, size.width);
//     path.close();
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
