import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  double xPos = 0.0;
  double yPos = 0.0;
  final int shapeSize = 30;

  @override
  Widget build(BuildContext context) {
    // First positions of circle
    pos.add(Position(192, 476));
    pos.add(Position(312, 253));
    pos.add(Position(52, 253));

    Material circle = Material(
        child: Ink(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purpleAccent, width: 3),
        color: Colors.purpleAccent,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        //This keeps the splash effect within the circle
        borderRadius: BorderRadius.circular(20),

        child: const Padding(
          padding: EdgeInsets.all(0),
          child: Icon(
            Icons.circle,
            color: Colors.white,
          ),
        ),
      ),
    ));

    return Scaffold(
      body: Stack(
        clipBehavior:
            Clip.antiAlias, // An attempt to clip overflowing widgets :(
        children: <Widget>[
          Positioned(child: CustomPaint(painter: LinePainter(pos, shapeSize))),
          Positioned(
            child: CustomMultiChildLayout(
              delegate: DragArea(pos),
              children: <Widget>[
                LayoutId(
                  id: 'c0',
                  child: Draggable(
                    feedback: circle,
                    child: circle,
                    childWhenDragging: Container(),
                    onDragUpdate: (DragUpdateDetails d) {
                      setState(() {
                        pos[0].setPosition(d.globalPosition.dx - shapeSize / 2,
                            d.globalPosition.dy - shapeSize / 2);
                      });
                    },
                  ),
                ),
                LayoutId(
                  id: 'c1',
                  child: Draggable(
                    feedback: circle,
                    child: circle,
                    childWhenDragging: Container(),
                    onDragUpdate: (DragUpdateDetails d) {
                      setState(() {
                        pos[1].setPosition(d.globalPosition.dx - shapeSize / 2,
                            d.globalPosition.dy - shapeSize / 2);
                      });
                    },
                  ),
                ),
                LayoutId(
                  id: 'c2',
                  child: Draggable(
                    feedback: circle,
                    child: circle,
                    childWhenDragging: Container(),
                    onDragUpdate: (DragUpdateDetails d) {
                      setState(() {
                        pos[2].setPosition(d.globalPosition.dx - shapeSize / 2,
                            d.globalPosition.dy - shapeSize / 2);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  List<Position> positions = [];
  final int circleSize;

  LinePainter(this.positions, this.circleSize);

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Draw lines between cirle positions
    var path = Path();
    // Add + icon size / 2 to center triangle corners in circle
    path.moveTo(
        positions[0].x + circleSize / 2, positions[0].y + circleSize / 2);
    path.lineTo(
        positions[1].x + circleSize / 2, positions[1].y + circleSize / 2);
    path.lineTo(
        positions[2].x + circleSize / 2, positions[2].y + circleSize / 2);
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Enable to redraw line onDragUpdate
  }
}

// Clickable area for dragging
class DragArea extends MultiChildLayoutDelegate {
  List<Position> p = [];

  DragArea(this.p);

  @override
  void performLayout(Size size) {
    for (int i = 0; i < 3; i++) {
      layoutChild('c' + i.toString(), BoxConstraints.loose(size));
      positionChild('c' + i.toString(), Offset(p[i].x, p[i].y));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
