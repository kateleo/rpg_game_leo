import 'dart:math';

class Dice {
  static final Random _random = Random();

  static int roll(int count, int sides) {
    int total = 0;
    for (var i = 0; i < count; i++) {
      total += _random.nextInt(sides) + 1;
    }
    return total;
  }

  static bool attackSuccess(int modifier) {
    for (int i = 0; i < modifier; i++) {
      final roll = _random.nextInt(6) + 1;
      if (roll >= 5) {
        return true;
      }
    }
    return false;
  }
}