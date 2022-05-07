import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  final List points = [3];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffff99af)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(size.width * 1 / 6, size.height * 1 / 2),
        Offset(size.width * 1 / 6, size.height * 1), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
