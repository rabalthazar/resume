import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resume/components/asset_avatar.dart';
import 'package:resume/data/person_data.dart';
import 'package:resume/model/entity/person.dart';
import 'package:resume/screen/resume/components/contacts.dart';
import 'package:resume/screen/resume/components/education_list.dart';
import 'package:resume/screen/resume/components/header_title.dart';
import 'package:resume/screen/resume/components/language_selector.dart';
import 'package:resume/screen/resume/components/summary.dart';

import 'components/experience_list.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({
    Key? key,
  }) : super(key: key);

  static double headerHeight = 100.0;

  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  bool _isLargeScreen = false;
  late Person _person;

  List<Widget> _buildDetailsViewWidgets() {
    return [
      Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Summary(summary: _person.summary),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: EducationList(items: _person.education),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ExperienceList(items: _person.experience),
      ),
    ];
  }

  Widget _buildDetailsView() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _buildDetailsViewWidgets(),
      ),
    );
  }

  Widget _buildContactsView(double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: AssetAvatar(
            url: _person.photoUrl,
            width: width,
          ),
        ),
        Contacts(
          email: _person.email,
          phone: _person.phone,
        ),
      ],
    );
  }

  Widget _buildLanguageSelectors() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final locale in AppLocalizations.supportedLocales)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: LanguageSelector(
                locale: locale,
              ),
            ),
        ],
      );

  Widget _buildLargeScreen() {
    const contactsWidth = 250.0;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: HeaderTitle(
          name: _person.name,
          title: _person.title,
          height: 150.0,
        ),
        actions: [
          _buildLanguageSelectors(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactsView(contactsWidth),
            _buildDetailsView(),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallScreen() {
    return Scaffold(
      appBar: AppBar(
        title: HeaderTitle(
          name: _person.name,
          title: _person.title,
          height: 100.0,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: AssetAvatar(url: _person.photoUrl),
            ),
            ListTile(
              title: Contacts(
                email: _person.email,
                phone: _person.phone,
              ),
            ),
            Center(child: _buildLanguageSelectors())
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: _buildDetailsViewWidgets(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    _person = PersonData.getData(locale);

    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (notification) {
        setState(() {});
        return true;
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          double screenWidth = MediaQuery.of(context).size.width;
          if (screenWidth > 600) {
            _isLargeScreen = true;
          }
          return _isLargeScreen ? _buildLargeScreen() : _buildSmallScreen();
        },
      ),
    );
  }
}
