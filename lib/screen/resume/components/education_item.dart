import 'package:flutter/material.dart';
import 'package:resume/components/info_card.dart';
import 'package:resume/model/entity/education.dart';

class EducationItem extends StatelessWidget {
  final Education item;

  const EducationItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String degree = [
      if (null != item.degree) item.degree,
      if (null != item.fieldOfStudy) item.fieldOfStudy,
    ].join(', ');
    return InfoCard(
      leading: Image.asset(item.logoUrl, width: 70.0),
      title: Text(item.school),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (degree.isNotEmpty) Text(degree),
          Text('${item.startYear} - ${item.endYear}'),
        ],
      ),
    );
  }
}
