import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleModel extends ChangeNotifier {
  LocaleModel();

  Locale _locale = Locale('en');

  Locale get locale => _locale;

  set locale (Locale locale) {
    if (_locale != locale && AppLocalizations.delegate.isSupported(locale)) {
      _locale = locale;
      notifyListeners();
    }
  }
}
