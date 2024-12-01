import 'package:chess2/pecas/moves_utils/diagonal_moves.dart';
import 'package:chess2/pecas/moves_utils/horizontal_vertical_moves.dart';
import 'package:chess2/pecas/peca.dart';
import 'package:chess2/position.dart';
import 'package:chess2/tabuleiro.dart';

class Rei extends Peca {
  @override
  List<Position> allowedPositions(Tabuleiro tab) {
    return getVerticalMoves(tab, isWhite, x, y) +
        getHorizontalMoves(tab, isWhite, x, y) +
        getDiagonalMoves(tab, isWhite, x, y);
  }

  Rei(
      int x,
      int y,
      bool isWhite,
      ) : super(
    x: x,
    y: y,
    assetPath:
    isWhite ? 'assets/white_king.png' : 'assets/black_king.png',
    isWhite: isWhite,
  );
}
