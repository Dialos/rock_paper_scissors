import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  final rng = Random();
  while (true) {
    stdout.write('Rock, Paper or Scissors? (r/p/s) or q to quit: ');
    final input = stdin.readLineSync();
    if (input == 'r' || input == 'p' || input == 's') {
      var playerMove;
      if (input == 'r') {
        playerMove = Move.rock;
      } else if (input == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      print('You played: ${playerMove}');
      print('AI played: ${aiMove.name}');
      if (playerMove == aiMove) {
        print('It\'s a draw!');
      } else if (playerMove == Move.rock && aiMove == Move.scissors ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissors && aiMove == Move.paper) {
        print('You win!');
      } else {
        print('You lose!');
      }
    } else if (input == 'q') {
      print('Bye!');
      break;
    } else {
      print('Invalid input');
    }
  }
}
