import 'package:flutter/material.dart';

import 'square_clipper.dart';

class ClipCircle extends StatelessWidget {
  const ClipCircle({
    this.key,
    this.clipBehavior = Clip.antiAlias,
    required this.child,
  }) : super(key: key);

  final Key? key;
  final Clip clipBehavior;
  final Widget child;

  @override
  Widget build(BuildContext context) => ClipOval(
    key: key,
    clipper: SquareClipper(),
    clipBehavior: clipBehavior,
    child: child,
  );
}
