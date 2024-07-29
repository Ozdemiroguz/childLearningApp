import 'package:tododyst/features/clock_game/domain/repository/models/day_time_zone.dart';

class ClockQuestion {
  final int hour;
  final int minute;
  final DayTimeZone dayTimeZone;

  ClockQuestion({
    required this.hour,
    required this.minute,
    required this.dayTimeZone,
  });
}
