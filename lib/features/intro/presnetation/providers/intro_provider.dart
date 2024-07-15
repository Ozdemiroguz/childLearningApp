//Intro state ile Intro provider

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../states/intro_state.dart';

final introProvider = NotifierProvider.autoDispose<_IntroNotifier, IntroState>(
  _IntroNotifier.new,
);

class _IntroNotifier extends AutoDisposeNotifier<IntroState> {
  @override
  IntroState build() {
    return IntroState.initial();
  }

  void changeCounter(
    int index,
  ) {
    state = state.copyWith(counter: index);
  }

  void changeLevels(
    int index,
  ) {
    final levels = state.levels.map((e) => false).toList();
    levels[index] = true;
    state = state.copyWith(levels: levels);
  }
}
