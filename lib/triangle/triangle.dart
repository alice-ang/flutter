import 'package:flutter/material.dart';
import 'package:petli/triangle/triangle_painter.dart';
import 'package:logging/logging.dart';

class Triangle extends StatefulWidget {
  const Triangle({Key? key}) : super(key: key);

  @override
  State<Triangle> createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
  var xPos = 0; // must me mutable
  var yPos = 0;
  final bool _isDragged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            // setState(() {});
          },
          child: CustomPaint(
              size: const Size(200, 200), painter: TrianglePainter()),
        ),

        // Center content on screen
        // child: Padding(
        //   child: Text(
        //     'Hi! 🥑',
        //     style: TextStyle(fontSize: 25),
        //   ),
        //   padding: EdgeInsets.all(10),
        // ),
      ),
    );
  }
}
