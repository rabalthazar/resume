import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final String summary;

  const Summary({Key? key, required this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Summary',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            summary,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
