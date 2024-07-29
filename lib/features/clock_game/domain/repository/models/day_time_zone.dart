//günün zamanlarını içeren bir enum oluştur
//morning, afternoon,  night

enum DayTimeZone {
  morning,
  afternoon,
  night,
}

//enumdan stringe çevirme
extension DayTimeZoneExtension on DayTimeZone {
  String get value {
    switch (this) {
      case DayTimeZone.morning:
        return "Morning";
      case DayTimeZone.afternoon:
        return "Afternoon";
      case DayTimeZone.night:
        return "Night";
    }
  }
}

//stringden enum a çevirme
DayTimeZone getDayTimeZone(String value) {
  switch (value) {
    case "Morning":
      return DayTimeZone.morning;
    case "Afternoon":
      return DayTimeZone.afternoon;
    case "Night":
      return DayTimeZone.night;
    default:
      return DayTimeZone.morning;
  }
}

// saatten enuma çevirme

DayTimeZone getDayTimeZoneFromHour(int hour) {
  if (hour >= 5 && hour < 12) {
    return DayTimeZone.morning;
  } else if (hour >= 12 && hour < 19) {
    return DayTimeZone.afternoon;
  } else {
    return DayTimeZone.night;
  }
}
