import 'package:flutter/material.dart';
import 'package:petli/circle/circle_painter.dart';

class Circle extends StatefulWidget {
  const Circle({Key? key}) : super(key: key);

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  var xPos = 0.0;
  var yPos = 0.0;
  var pos = const Offset(0, 0);
  final width = 100.0;
  final height = 100.0;
  bool _isDragged =
      false; // _variable can only be accesed inside the class (private)

  Offset get circlePos {
    return pos;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) => setState(() {
        _isDragged = true;
      }),
      onPanEnd: (DragEndDetails dragEndDetails) {
        setState(() {
          _isDragged = false;
        });
      },
      onPanUpdate: (details) {
        if (_isDragged) {
          setState(() {
            xPos += details.delta.dx;
            yPos += details.delta.dy;
            pos = Offset(xPos, yPos);
          });
        }
      },
      child: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: CirclePainter(pos),
          child: Container(),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(this.offsetPos);
  final Offset offsetPos;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffff99af)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(offsetPos, 10, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
