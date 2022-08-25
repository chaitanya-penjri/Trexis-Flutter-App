enum JobTypes { FRONTEND, BACKEND, MOBILE, TESTING }

enum ProgrammingLanguages { SWIFT, KOTLIN, DART, JAVASCRIPT, JAVA }

class UserPreferences {
  final String name;
  final JobTypes jobType;
  final Set<ProgrammingLanguages> programmingLanguages;
  final bool isInterested;

  UserPreferences({
    required this.name,
    required this.jobType,
    required this.programmingLanguages,
    required this.isInterested,
  });
}
