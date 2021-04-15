import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ffi/ffi.dart';

typedef pazusoba_func = Void Function(Int32, Pointer<Pointer<Int8>>);
typedef Pazusoba = void Function(int, Pointer<Pointer<Int8>>);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCalculating = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(isCalculating ? 'Calculating...' : 'Call pazusoba'),
              onPressed: () {
                setState(() {
                  isCalculating = true;
                });
                Timer(const Duration(milliseconds: 100), () {
                  final libary =
                      DynamicLibrary.open('assets/library/pazusoba.so');
                  final Pazusoba pazusoba = libary
                      .lookup<NativeFunction<pazusoba_func>>('pazusoba')
                      .asFunction<Pazusoba>();
                  final Pointer<Pointer<Int8>> list = malloc();
                  pazusoba(0, list);
                  setState(() {
                    isCalculating = false;
                  });
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
