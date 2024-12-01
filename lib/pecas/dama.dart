import 'package:chess2/pecas/moves_utils/diagonal_moves.dart';
import 'package:chess2/pecas/moves_utils/horizontal_vertical_moves.dart';
import 'package:chess2/pecas/peca.dart';
import 'package:chess2/position.dart';
import 'package:chess2/tabuleiro.dart';

class Dama extends Peca {
  @override
  List<Position> allowedPositions(Tabuleiro tab) {
    return getVerticalMoves(tab, isWhite, x, y) +
        getHorizontalMoves(tab, isWhite, x, y) +
        getDiagonalMoves(tab, isWhite, x, y);
  }

  Dama(
    int x,
    int y,
    bool isWhite,
  ) : super(
          x: x,
          y: y,
          assetPath:
              isWhite ? 'assets/white_queen.png' : 'assets/black_queen.png',
          isWhite: isWhite,
        );
}
