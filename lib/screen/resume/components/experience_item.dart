import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume/components/asset_avatar.dart';
import 'package:resume/components/info_card.dart';
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

    return InfoCard(
      leading: Image.asset(
        item.logoUrl,
        width: 70.0,
      ),
      title: Text(
        item.title,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            [
              item.company,
              if (null != item.location) item.location,
              item.employmentType.asString(),
            ].join(' - '),
          ),
          Text(
            '$strStart - $strEnd',
          ),
        ],
      ),
      body: null != item.description ? Text(item.description!) : null,
    );
  }
}
