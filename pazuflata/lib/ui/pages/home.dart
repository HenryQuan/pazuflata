import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pazuflata/core/pazusoba.dart';
import 'package:pazuflata/helpers/loading_overlay.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellowAccent,
    Colors.deepPurpleAccent,
    Colors.pinkAccent,
  ];

  final col = 7;
  final row = 6;

  final size = 64.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (size * col).toDouble(),
              height: (size * col).toDouble(),
              child: GridView.count(
                crossAxisCount: col,
                shrinkWrap: true,
                children: List.generate(col * row, (index) {
                  return Center(
                    child: Draggable(
                      feedback: Opacity(
                        opacity: 0.5,
                        child: Container(
                          height: size,
                          width: size,
                          color: Colors.white,
                        ),
                      ),
                      child: DragTarget(
                        builder: (context, a, b) => Container(
                          height: size,
                          width: size,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size / 2),
                            color: colors[Random().nextInt(6)],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            ElevatedButton(
              child: Text('Call pazusoba'),
              onPressed: () {
                LoadingOverlay.display(context);
                Timer(const Duration(milliseconds: 200), () {
                  Pazusoba.instance.calculate();

                  Timer(const Duration(milliseconds: 200), () {
                    LoadingOverlay.hide(context);
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
