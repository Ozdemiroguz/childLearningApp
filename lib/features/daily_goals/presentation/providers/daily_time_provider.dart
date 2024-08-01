//Home state ile Home provider

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/daily_goals/presentation/states/daly_time/daily_time_state.dart';

final dailyTimeProvider =
    NotifierProvider.autoDispose<_HomeNotifier, DailyTimeState>(
  _HomeNotifier.new,
);

class _HomeNotifier extends AutoDisposeNotifier<DailyTimeState> {
  @override
  DailyTimeState build() {
    Future(() => getHomeData());
    return DailyTimeState.initial();
  }

  Future<void> getHomeData() async {}

  void selectedDaysIndexes(int index) {
    final Set<int> selectedDaysIndexes = Set.from(state.selectedDaysIndexes);

    if (selectedDaysIndexes.contains(index)) {
      selectedDaysIndexes.remove(index);
    } else {
      selectedDaysIndexes.add(index);
    }

    state = state.copyWith(selectedDaysIndexes: selectedDaysIndexes);
  }

  void increaseHourAndMinute() {
    int hour = state.hour;
    int minute = state.minute;

    minute += 15;
    if (minute >= 60) {
      minute = 0;
      hour += 1;
    }

    state = state.copyWith(hour: hour % 24, minute: minute);
  }

  void reduceHourAndMinute() {
    int hour = state.hour;
    int minute = state.minute;

    minute -= 15;
    if (minute < 0) {
      minute = 45;
      hour -= 1;
    }

    state = state.copyWith(hour: hour % 24, minute: minute);
  }
}
