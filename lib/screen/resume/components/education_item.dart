import 'package:flutter/material.dart';
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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            item.logoUrl,
            width: 90.0,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.school,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (degree.isNotEmpty) Text(degree),
              Text('${item.startYear} - ${item.endYear}'),
            ],
          ),
        ),
      ],
    );
  }
}
