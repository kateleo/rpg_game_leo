abstract class Creature {
  final String name;
  final int attack;
  final int defense;
  final int maxHealth;
  final int minDamage;
  final int maxDamage;

  int health;

  Creature({
    required this.name,
    required this.attack,
    required this.defense,
    required this.maxHealth,
    required this.minDamage,
    required this.maxDamage,
  })  : assert(attack >= 1 && attack <= 30),
        assert(defense >= 1 && defense <= 30),
        assert(maxHealth > 0),
        assert(minDamage > 0 && maxDamage >= minDamage),
        health = maxHealth;

  bool get isAlive => health > 0;

  int dealDamage() {
    return minDamage + (maxDamage - minDamage > 0
        ? (Dice.roll(1, maxDamage - minDamage + 1) - 1)
        : 0);
  }

  void takeDamage(int amount) {
    health -= amount;
    if (health < 0) health = 0;
    print('$name takes $amount damage. Health: $health/$maxHealth');
  }

  void hit(Creature other);
}