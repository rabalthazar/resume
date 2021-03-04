import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String name;
  final String title;
  final double height;

  const HeaderTitle({
    Key? key,
    required this.name,
    required this.title,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Center(
        child: FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                title,
                style:  Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
