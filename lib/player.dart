import 'creature.dart';
import 'dice.dart';

class Player extends Creature {
  int healsLeft = 4;

  Player({
    required super.name,
    required super.attack,
    required super.defense,
    required super.maxHealth,
    required super.minDamage,
    required super.maxDamage,
  });

  void heal() {
    if (healsLeft <= 0) {
      print('No heals left!');
      return;
    }
    final healAmount = (maxHealth * 0.3).round();
    health += healAmount;
    if (health > maxHealth) health = maxHealth;
    healsLeft--;
    print('$name heals for $healAmount. Health: $health/$maxHealth');
  }

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