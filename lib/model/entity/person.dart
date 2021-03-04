import 'package:resume/model/entity/education.dart';

class Person {
  Person({
    required this.name,
    required this.title,
    required this.photoUrl,
    this.email,
    this.phone,
    required this.summary,
    List<Education>? education,
  }) : this.education = education ?? [];

  String name;
  String title;
  String photoUrl;
  String? email;
  String? phone;
  String summary;
  List<Education> education;
}
