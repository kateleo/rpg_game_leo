import 'creature.dart';
import 'dice.dart';

class Monster extends Creature {
  Monster({
    required super.name,
    required super.attack,
    required super.defense,
    required super.maxHealth,
    required super.minDamage,
    required super.maxDamage,
  });

  @override
  void hit(Creature other) {
    final modifier = (attack - other.defense + 1).clamp(1, 100);
    final success = Dice.attackSuccess(modifier);
    if (success) {
      final damage = dealDamage();
      other.takeDamage(damage);
      print('$name hits \${other.name} for \$damage!');
    } else {
      print('$name misses the attack!');
    }
  }
}