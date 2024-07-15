import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/crossword/domain/models/word_data.dart';
import 'package:tododyst/services/timer/otp_timer.dart';

import '../../../../core/injections/locator.dart';
import '../pages/chapters_page.dart';
import '../states/crossword_state.dart';

final crosswordProvider =
    NotifierProvider.autoDispose<_CrossWordNotifier, CrossWordState>(
  _CrossWordNotifier.new,
);

class _CrossWordNotifier extends AutoDisposeNotifier<CrossWordState> {
  @override
  CrossWordState build() {
    // Timer'ı dinleyiciye bağlayın

    Future(() => init());
    return CrossWordState.initial();
  }

  Future<void> init() async {
    setLoading(true);

    final timerNotifier = ref.watch(timerProvider);
    timerNotifier.start(duration: const Duration(seconds: 10));

    timerNotifier.addListener(() {
      state = state.copyWith(time: timerNotifier.time);
    });

    final result = await ref
        .read(crosswordRepositoryProvider)
        .getCrosswords(ref.read(sectionIdProvider));

    state = state.copyWith(
      isLoading: false,
      wordData: result.getOrElse((l) => WordData(board: [], words: [])),
    );
  }

  void onChangedWordsToFind(List<String> wordsToFind) {
    state = state.copyWith(wordsToFind: wordsToFind);

    if (state.wordsToFind.length == state.wordData.words.length) {
      state = state.copyWith(sectionCompleted: true);
    }
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
