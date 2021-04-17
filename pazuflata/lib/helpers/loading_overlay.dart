import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingOverlay {
  LoadingOverlay._init();

  static void display(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        child: Container(
          height: 64,
          width: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              'Calculating...',
            ),
          ),
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
