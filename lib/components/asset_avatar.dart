import 'package:flutter/material.dart';

import 'clip_circle.dart';

class AssetAvatar extends StatelessWidget {
  const AssetAvatar({Key? key, required this.url, this.width}) : super(key: key);

  final String url;
  final double? width;

  @override
  Widget build(BuildContext context) => ClipCircle(
      child: Image.asset(url, width: width,),
    );
}
