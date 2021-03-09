import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  InfoCard({this.leading, required this.title, this.subtitle, this.body,});

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.subtitle1 ?? TextStyle();
    final subtitleStyle = theme.textTheme.bodyText2?.copyWith(color: theme.textTheme.caption!.color) ?? TextStyle();

    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (null != leading ) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0,),
            child: leading,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: titleStyle,
                    child: title,
                  ),
                  if (null != subtitle) Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: DefaultTextStyle(
                      style: subtitleStyle,
                      child: subtitle!,
                    ),
                  ),
                  if (null != body) Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: body!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
