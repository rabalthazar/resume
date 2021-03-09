enum EmploymentType {
  FullTime,
  PartTime,
  SelfEmployed,
  Freelance,
  Contract,
  Internship,
  Apprenticeship,
  Trainee,
}

extension EmploymentTypeToString on EmploymentType {
  String asString() {
    switch (this) {
      case EmploymentType.FullTime:
        return 'Full-time';
      case EmploymentType.PartTime:
        return 'Part-time';
      case EmploymentType.SelfEmployed:
        return 'Self-employed';
      default:
        return this.toString().split('.').last;
    }
  }

}

class Experience {
  Experience({
    required this.logoUrl,
    required this.title,
    required this.employmentType,
    required this.company,
    this.location,
    required this.currentlyWorking,
    required this.startMonth,
    required this.startYear,
    this.endMonth,
    this.endYear,
    this.description,
  });

  String logoUrl;
  String title;
  EmploymentType employmentType;
  String company;
  String? location;
  bool currentlyWorking;
  int startMonth;
  int startYear;
  int? endMonth;
  int? endYear;
  String? description;
}
