import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final List points = [3];

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    final paint = Paint()
      ..color = const Color(0xffff99af)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    // canvas.drawPath(
    //     Path()
    //       ..addPolygon([
    //         const Offset(0, 0),
    //         const Offset(10, 0),
    //         const Offset(10, 10),
    //         const Offset(0, 10),
    //       ], true),
    //     paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
