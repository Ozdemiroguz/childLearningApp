enum UserType {
  student,
  teacher,
  parent,
}

extension UserTypeX on UserType {
  String get name {
    switch (this) {
      case UserType.student:
        return 'Student';
      case UserType.teacher:
        return 'Teacher';
      case UserType.parent:
        return 'Parent';
    }
  }
}
