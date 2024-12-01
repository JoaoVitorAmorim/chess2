import 'package:chess2/position.dart';
import 'package:chess2/tabuleiro.dart';

abstract class Peca {
  final String assetPath;
  List<Position> allowedPositions(Tabuleiro tab);
  final bool isWhite;
  int x;
  int y;

  Peca({
    required this.assetPath,
    required this.isWhite,
    required this.x,
    required this.y,
    allowedPositions,
  });

  void updatePosition(int x, int y){
    this.x = x;
    this.y = y;
  }
}
