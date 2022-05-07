import 'package:flutter/material.dart';
import 'package:petli/circle/circle.dart';
import 'package:petli/shape/shape.dart';
import 'package:petli/triangle/triangle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final c1 = const Circle();
  static const c2 = Circle();
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
            body: CustomMultiChildLayout(
              delegate: DragArea(),
              children: <Widget>[
                LayoutId(
                  id: 't0',
                  child: Draggable(
                    feedback: Icon(Icons.filter_vintage),
                    child: const Icon(
                      Icons.ac_unit,
                      color: Colors.green,
                    ),
                    childWhenDragging: Container(),
                    onDragEnd: (DraggableDetails d) {
                      print(d);
                    },
                  ),
                ),
              ],
            )));
  }
}

class DragArea extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    for (int i = 0; i < 3; i++) {
      layoutChild('t' + i.toString(), BoxConstraints.loose(size));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
