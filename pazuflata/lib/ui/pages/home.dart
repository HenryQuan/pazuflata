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
  @override
  void initState() {
    super.initState();

    final libary = DynamicLibrary.process();
    final Pazusoba pazusoba = libary
        .lookup<NativeFunction<pazusoba_func>>('pazusoba')
        .asFunction<Pazusoba>();
    final Pointer<Pointer<Int8>> list = malloc();
    pazusoba(0, list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
