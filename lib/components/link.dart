import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class Link extends StatefulWidget {
  const Link({
    Key? key,
    required this.text,
    required this.href,
    this.style,
  }) : super(key: key);

  final String text;
  final String href;
  final TextStyle? style;

  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
  late GestureRecognizer _gestureRecognizer;

  @override
  void initState() {
    super.initState();
    _gestureRecognizer = TapGestureRecognizer()
      ..onTap = () => _launchUrl(widget.href);
  }

  Future<bool> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      return await launch(url);
    }
    return false;
  }

  @override
  void dispose() {
    _gestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = widget.style ??
        DefaultTextStyle.of(context).style.copyWith(
              color: Colors.blue,
            );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: RichText(
        text: TextSpan(
          text: widget.text,
          style: style,
          recognizer: _gestureRecognizer,
        ),
      ),
    );
  }
}
