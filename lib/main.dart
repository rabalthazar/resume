import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:resume/data/person_data.dart';
import 'package:resume/provider/locale_provider.dart';
import 'package:resume/screen/resume/resume_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LocaleModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleModel>(
      builder: (BuildContext context, LocaleModel localeModel, Widget? child) =>
          MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: localeModel.locale,
        title: 'Flutter Demo',
        onGenerateTitle: (context) {
          final locale = Localizations.localeOf(context);
          final name = PersonData.getData(locale).name;
          return AppLocalizations.of(context)!.appTitle(name);
        },
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(75, 75, 75, 1.0),
          fontFamily: 'Raleway',
          textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: 1.1,
              ),
        ),
        home: ResumeScreen(),
      ),
    );
  }
}
