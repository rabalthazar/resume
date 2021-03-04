import 'package:flutter/material.dart';
import 'package:resume/model/entity/education.dart';
import 'package:resume/screen/resume/components/education_item.dart';

class EducationList extends StatelessWidget {
  final List<Education> items;

  const EducationList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortedItems = List<Education>.from(items)
      ..sort((Education a, Education b) {
        final orderStart = b.startYear - a.startYear;
        return orderStart != 0 ? orderStart : b.endYear - a.endYear;
      });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Education',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (Education item in sortedItems)
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: EducationItem(item: item),
                ),
            ],
          ),
        )
      ],
    );
  }
}
