import 'package:chess2/pecas/moves_utils/diagonal_moves.dart';
import 'package:chess2/pecas/peca.dart';
import 'package:chess2/position.dart';
import 'package:chess2/tabuleiro.dart';

class Bispo extends Peca {
  @override
  List<Position> allowedPositions(Tabuleiro tab) {
    return getDiagonalMoves(tab, isWhite, x, y);
  }

  Bispo(
    int x,
    int y,
    bool isWhite,
  ) : super(
          x: x,
          y: y,
          assetPath:
              isWhite ? 'assets/white_bishop.png' : 'assets/black_bishop.png',
          isWhite: isWhite,
        );
}
