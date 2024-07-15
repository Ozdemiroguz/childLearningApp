enum CrosswordGameType {
  animals,
  colors,
}

extension CrosswordGameTypeX on CrosswordGameType {
  String get name {
    switch (this) {
      case CrosswordGameType.animals:
        return 'Animals';
      case CrosswordGameType.colors:
        return 'Colors';
    }
  }

  String get image {
    switch (this) {
      case CrosswordGameType.animals:
        return 'assets/images/animalsparty.png';
      case CrosswordGameType.colors:
        return 'assets/images/colorsback.png';
    }
  }
}
