import 'package:tododyst/features/crossword/domain/models/crossword_game_type.dart';

class CrosswordGame {
  final int level;
  final CrosswordGameType type;

  CrosswordGame({
    required this.level,
    required this.type,
  });
}
