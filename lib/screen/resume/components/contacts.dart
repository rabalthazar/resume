import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resume/components/empty_widget.dart';
import 'package:resume/components/link.dart';

class Contacts extends StatelessWidget {
  final String? email;
  final String? phone;

  const Contacts({Key? key, this.email, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return null != email || null != phone
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  AppLocalizations.of(context)!.contact.toUpperCase(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              if (null != email)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Link(
                          text: email!,
                          href: 'mailto:' + email!,
                        ),
                      ),
                    ],
                  ),
                ),
              if (null != phone)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_android),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(phone!),
                      ),
                    ],
                  ),
                ),
            ],
          )
        : EmptyWidget();
  }
}
