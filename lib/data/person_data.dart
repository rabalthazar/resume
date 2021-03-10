import 'package:flutter/material.dart';
import 'package:resume/model/entity/education.dart';
import 'package:resume/model/entity/experience.dart';
import 'package:resume/model/entity/person.dart';

class PersonData {
  static Person getData(Locale? locale) {
    final countryCode = null != locale &&
        _personData.keys.contains(locale.languageCode)
        ? locale.languageCode
        : 'en';

    return _personData[countryCode]!;
  }

  static final _personData = {
    'en': Person(
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
      experience: [
        Experience(
            logoUrl: 'images/ipp.png',
            title: 'Software Developer',
            employmentType: EmploymentType.Contract,
            company:
            'Instituto Municipal Pereira Passos - Prefeitura do Rio de Janeiro',
            location: 'Rio de Janeiro, RJ, Brazil',
            currentlyWorking: false,
            startMonth: 8,
            startYear: 1998,
            endMonth: 1,
            endYear: 2000,
            description: 'Geographic Information Systems (GIS) developer\n'
                'Implantation of aero/satellite photos and huge image manipulation systems\n'
                'Spatial Database Engine (SDE) administration'),
        Experience(
          logoUrl: 'images/controllab.jpeg',
          title: 'IT Manager',
          employmentType: EmploymentType.FullTime,
          company: 'Controllab',
          location: 'Rio de Janeiro, RJ, Brazil',
          currentlyWorking: true,
          startMonth: 2,
          startYear: 2000,
        ),
      ],
    ),
    'pt': Person(
      name: 'Rafael de Almeida Balthazar',
      title: 'Engenheiro de Computação / MBA, Gerenciamento de Projetos',
      photoUrl: 'images/photo.jpeg',
      email: 'rabalthazar@gmail.com',
      phone: '+55 21 99800-2020',
      summary:
      'Engenheiro de computação altamente qualificado e comprometido com '
          'mais de 20 anos de experiência em desenvolvimento de software atuando '
          'como gestor de equipes, designer de soluções e programador. Na minha '
          'atual empresa tive papel fundamental para trazê-la da linha de '
          'comando e papel para a web e dispositivos móveis, abrindo novas '
          'possibilidades e mercados, fazendo com que crescesse em mas de 4 '
          'vezes em número de clientes. Também tenho conhecimentos sólidos em '
          'configuração de servidores e serviços como web, mail, banco de dados, '
          'etc., em especial servidores linux.\n'
          'Atualmente atuo como gestor de TI participando ativamente de todas as '
          'etapas do desenvolvimento, contratações e gerenciamento de pessoal e '
          'projetos.',
      education: [
        Education(
          logoUrl: 'images/puc.png',
          school: 'Pontifícia Universidade Católica do Rio de Janeiro',
          startYear: 1994,
          endYear: 2000,
          degree: 'Graduação',
          fieldOfStudy: 'Engenharia de Computação',
        ),
        Education(
          logoUrl: 'images/fgv.png',
          school: 'Fundação Getúlio Vargas',
          startYear: 2004,
          endYear: 2006,
          degree: 'Master of Business Administration',
          fieldOfStudy: 'Gerenciamento de Projetos',
        ),
      ],
      experience: [
        Experience(
          logoUrl: 'images/ipp.png',
          title: 'Desenvolvedor de Software',
          employmentType: EmploymentType.Contract,
          company:
          'Instituto Municipal Pereira Passos - Prefeitura do Rio de Janeiro',
          location: 'Rio de Janeiro, RJ, Brasil',
          currentlyWorking: false,
          startMonth: 8,
          startYear: 1998,
          endMonth: 1,
          endYear: 2000,
          description:
          'Desenvolvimento de sistemas de informação geográfica (Geographic Information Systems/GIS)\n'
              'Implantação de sistemas para manipulação de imagens gigantescas (huge image) aéreas ou de satélites\n'
              'Administração da base de dados espacial (Spatial Database Engine/SDE)',
        ),
        Experience(
          logoUrl: 'images/controllab.jpeg',
          title: 'Gestor de TI',
          employmentType: EmploymentType.FullTime,
          company: 'Controllab',
          location: 'Rio de Janeiro, RJ, Brazil',
          currentlyWorking: true,
          startMonth: 2,
          startYear: 2000,
        ),
      ],
    ),
  };
}
