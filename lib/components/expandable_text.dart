import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(
    this.text, {
    Key? key,
    this.maxLines,
    this.startsExpanded = false,
    this.moreText = 'see more',
    this.lessText = 'see less',
  }) : super(key: key);

  final String text;
  final int? maxLines;
  final bool startsExpanded;
  final String moreText;
  final String lessText;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = null != widget.maxLines ? widget.startsExpanded : true;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textObject = RichText(text: TextSpan(text: widget.text));
        final boxes = textObject.measure(context, constraints);

        return (null == widget.maxLines || boxes.length < widget.maxLines!)
            ? textObject
            : !_isExpanded
                ? Stack(
                    alignment: Alignment(1.0, 1.0),
                    children: [
                      Text(
                        widget.text,
                        overflow: TextOverflow.clip,
                        maxLines: _isExpanded ? null : widget.maxLines,
                      ),
                      GestureDetector(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            '...${widget.moreText}',
                            style: TextStyle(
                                color: Colors.blue,
                                backgroundColor: Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                      ),
                      // TODO: This 'link' can be a component
                      GestureDetector(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            widget.lessText,
                            style: TextStyle(
                              color: Colors.blue,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                      ),
                    ],
                  );
      },
    );
  }
}

extension _TextMeasurer on RichText {
  List<TextBox> measure(BuildContext context, BoxConstraints constraints) {
    final renderObject = createRenderObject(context)..layout(constraints);
    return renderObject.getBoxesForSelection(TextSelection(
      baseOffset: 0,
      extentOffset: text.toPlainText().length,
    ));
  }
}
