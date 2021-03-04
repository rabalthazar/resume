import 'dart:math';

import 'package:flutter/material.dart';

class SquareClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    double width = min(size.width, size.height);
    return Rect.fromLTWH((size.width / 2.0) - (width / 2.0),
        (size.height / 2.0) - (width / 2.0), width, width);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
