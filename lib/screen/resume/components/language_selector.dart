import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:resume/provider/locale_provider.dart';

class LanguageSelector extends StatelessWidget {
  LanguageSelector({required this.locale});

  final Locale locale;

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Image.asset('images/flag_${locale.languageCode}.png'),
          onTap: () {
            if (AppLocalizations.supportedLocales.contains(locale)) {
              Provider.of<LocaleModel>(context, listen: false).locale = locale;
            }
          },
        ),
      );
}
