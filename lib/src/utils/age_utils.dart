/// Full years elapsed since [birthDate] as of [now].
int currentAge({required DateTime birthDate, required DateTime now}) {
  var age = now.year - birthDate.year;
  final thisYearBirthday = DateTime(now.year, birthDate.month, birthDate.day);
  if (now.isBefore(thisYearBirthday)) {
    age--;
  }
  return age;
}
