import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef pazusoba_c = Void Function(Int32, Pointer<Pointer<Utf8>>);
typedef pazusoba_dart = void Function(int, Pointer<Pointer<Utf8>>);

class Pazusoba {
  late final pazusoba_dart pazusoba;

  static Pazusoba instance = Pazusoba._init();
  Pazusoba._init() {
    // Load the library once only
    final libary = DynamicLibrary.open('assets/library/pazusoba.so');
    pazusoba = libary
        .lookup<NativeFunction<pazusoba_c>>('pazusoba')
        .asFunction<pazusoba_dart>();
  }

  void calculate() {
    // Convert Dart string list to char **
    final list = [
      'pazusoba.exe',
      'GLHLGGLBDHDDDHGHHRDRLDDLGLDDRG',
      '3',
      '50',
      '1000',
    ];

    int argc = list.length;
    final argv = _convertFrom(list);
    // Call the native function
    pazusoba(argc, argv);
    _free(argv, argc);
  }

  Pointer<Pointer<Utf8>> _convertFrom(List<String> dartStringList) {
    int length = dartStringList.length;
    // Create a native char pointer
    final Pointer<Pointer<Utf8>> cStringList = malloc.allocate(length);
    for (int i = 0; i < length; i++) {
      cStringList[i] = dartStringList[i].toNativeUtf8();
    }
    return cStringList;
  }

  void _free(Pointer<Pointer<Utf8>> cStringList, int count) {
    // Free up memory
    for (int i = 0; i < count; i++) {
      malloc.free(cStringList[i]);
    }
    malloc.free(cStringList);
  }
}
