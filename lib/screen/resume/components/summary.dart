import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context)!.summary,
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
