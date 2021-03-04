import 'package:flutter/material.dart';
import 'package:resume/model/entity/education.dart';
import 'package:resume/model/entity/person.dart';
import 'package:resume/screen/resume/resume_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final person = Person(
      name: 'Rafael de Almeida Balthazar',
      title: 'Computer Engineer / MBA, Project Management',
      photoUrl: 'images/photo.jpeg',
      email: 'rabalthazar@gmail.com',
      phone: '+55 21 99800-2020',
      summary: 'High skilled and committed computer engineer with 20+ years '
          'experience in software development acting as team manager, solution '
          'designer and programmer. Over the years I helped to bring the '
          'company from command line and paper to the web and mobile, opening '
          'new possibilities and markets making it grow more than 4x in client '
          'numbers. I also have solid knowledge in servers and services '
          'configuration and maintenance.',
      education: [
        Education(
          logoUrl: 'images/puc.png',
          school: 'Pontifícia Universidade Católica do Rio de Janeiro',
          startYear: 1994,
          endYear: 2000,
          degree: 'Bachelor\'s',
          fieldOfStudy: 'Computer Engineering',
        ),
        Education(
          logoUrl: 'images/fgv.png',
          school: 'Fundação Getúlio Vargas',
          startYear: 2004,
          endYear: 2006,
          degree: 'Master of Business Administration',
          fieldOfStudy: 'Project Management',
        ),
      ],
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(75, 75, 75, 1.0),
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(fontSizeFactor: 1.1, ),
      ),
      home: ResumeScreen(
        person: person,
      ),
    );
  }
}
