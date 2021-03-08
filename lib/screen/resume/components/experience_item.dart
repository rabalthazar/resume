import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume/model/entity/experience.dart';

class ExperienceItem extends StatelessWidget {
  final Experience item;

  const ExperienceItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final start = DateTime(item.startYear, item.startMonth);
    final now = DateTime.now();
    final end = DateTime(item.endYear ?? now.year, item.endMonth ?? now.month);
    final formatter = DateFormat.yMMMM();
    final strStart = formatter.format(start);
    final strEnd = item.currentlyWorking ? 'Present' : formatter.format(end);
    final theme = Theme.of(context);

    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0,),
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text('EX'),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: theme.textTheme.subtitle1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      [
                        item.company,
                        if (null != item.location) item.location,
                        item.employmentType.asString(),
                      ].join(' - '),
                      style: theme.textTheme.bodyText2
                          ?.copyWith(color: theme.textTheme.caption!.color),
                    ),
                  ),
                  Text(
                    '$strStart - $strEnd',
                    style: theme.textTheme.bodyText2
                        ?.copyWith(color: theme.textTheme.caption!.color),
                  ),
                  if (null != item.description) Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(item.description!),
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
