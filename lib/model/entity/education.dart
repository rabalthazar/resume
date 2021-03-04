class Education {
  Education({
    required this.logoUrl,
    required this.school,
    required this.startYear,
    required this.endYear,
    this.degree,
    this.fieldOfStudy,
  });

  String logoUrl;
  String school;
  int startYear;
  int endYear;
  String? degree;
  String? fieldOfStudy;
}
