import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCanvas(),
    );
  }
}

class MyCanvas extends StatefulWidget {
  const MyCanvas({Key? key}) : super(key: key);

  @override
  _MyCanvasState createState() => _MyCanvasState();
}

class Position {
  double _x;
  double _y;

  Position(this._x, this._y);

  setPosition(double x, double y) {
    _x = x;
    _y = y;
  }

  double get x {
    return _x;
  }

  double get y {
    return _y;
  }
}

class _MyCanvasState extends State<MyCanvas> {
  var pos = <Position>[];

  @override
  Widget build(BuildContext context) {
    pos.add(Position(192, 476));
    pos.add(Position(312, 253));
    pos.add(Position(52, 253));
    pos.add(Position(50, 50));

    return Scaffold(
      body: Center(
        child: CustomMultiChildLayout(
          delegate: DragArea(pos),
          children: <Widget>[
            LayoutId(
              id: 't0',
              child: Draggable(
                feedback: const Icon(Icons.circle_outlined),
                child: const Icon(
                  Icons.circle_outlined,
                  color: Color(0xffff99af),
                ),
                childWhenDragging: Container(),
                onDragEnd: (DraggableDetails d) {
                  setState(() {
                    pos[0].setPosition(d.offset.dx, d.offset.dy);
                  });
                },
              ),
            ),
            LayoutId(
              id: 't1',
              child: Draggable(
                feedback: const Icon(Icons.circle_outlined),
                child: const Icon(
                  Icons.circle_outlined,
                  color: Color(0xffff99af),
                ),
                childWhenDragging: Container(),
                onDragEnd: (DraggableDetails d) {
                  setState(() {
                    pos[1].setPosition(d.offset.dx, d.offset.dy);
                  });
                },
              ),
            ),
            LayoutId(
              id: 't2',
              child: Draggable(
                feedback: const Icon(Icons.circle_outlined),
                child: const Icon(
                  Icons.circle_outlined,
                  color: Color(0xffff99af),
                ),
                childWhenDragging: Container(),
                onDragEnd: (DraggableDetails d) {
                  setState(() {
                    pos[2].setPosition(d.offset.dx, d.offset.dy);
                  });
                },
              ),
            ),
            LayoutId(id: 't3', child: CustomPaint(painter: LinePainter(pos))),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  var _positions = [];

  LinePainter(this._positions);

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = const Color(0xffff99af)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(_positions[0].x, _positions[0].y);
    path.lineTo(_positions[1].x, _positions[1].y);
    path.lineTo(_positions[2].x, _positions[2].y);
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DragArea extends MultiChildLayoutDelegate {
  var _p = <Position>[];

  DragArea(this._p);

  @override
  void performLayout(Size size) {
    for (int i = 0; i < 4; i++) {
      layoutChild('t' + i.toString(), BoxConstraints.loose(size));
      positionChild('t' + i.toString(), Offset(_p[i].x, _p[i].y));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
