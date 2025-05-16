import 'player.dart';
import 'monster.dart';

void main() {
  final player = Player(
    name: 'Hero',
    attack: 12,
    defense: 10,
    maxHealth: 100,
    minDamage: 4,
    maxDamage: 12,
  );

  final monster = Monster(
    name: 'Goblin',
    attack: 8,
    defense: 6,
    maxHealth: 50,
    minDamage: 2,
    maxDamage: 6,
  );

  int round = 1;
  while (player.isAlive && monster.isAlive) {
    print('\n-- Round \$round --');
    player.hit(monster);
    if (monster.isAlive) {
      monster.hit(player);
    }
    if (player.health <= 40 && player.healsLeft > 0) {
      player.heal();
    }
    round++;
  }

  print('\n== Battle Over ==');
  if (player.isAlive) {
    print('Player wins!');
  } else {
    print('Monster wins!');
  }
}