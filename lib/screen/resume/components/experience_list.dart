import 'package:flutter/material.dart';
import 'package:resume/model/entity/experience.dart';
import 'package:resume/screen/resume/components/experience_item.dart';

class ExperienceList extends StatelessWidget {
  final List<Experience> items;

  const ExperienceList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortedItems = List<Experience>.from(items)
      ..sort((Experience a, Experience b) {
        final orderStart = b.startYear - a.startYear;
        return orderStart != 0 ? orderStart : b.startMonth - a.startMonth;
      });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Experience',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (Experience item in sortedItems)
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: ExperienceItem(item: item),
                ),
            ],
          ),
        )
      ],
    );
  }
}
