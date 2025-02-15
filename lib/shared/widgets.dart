import 'package:flutter/material.dart';

class GlobWidgets {
  static Widget progressBar() {
    return Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(color: Colors.blue),
      ),
    );
  }
}
