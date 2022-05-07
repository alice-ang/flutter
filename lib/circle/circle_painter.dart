import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  var position = const Offset(50, 50);

  set circlePositon(Offset input) {
    print(input);
    position = input;
  }

  get circlePosition {
    return position;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffff99af)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(circlePosition, 10, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
