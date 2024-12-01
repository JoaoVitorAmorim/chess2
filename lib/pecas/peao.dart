import 'package:chess2/pecas/peca.dart';
import 'package:chess2/position.dart';
import 'package:chess2/tabuleiro.dart';

class Peao extends Peca {
  @override
  List<Position> allowedPositions(Tabuleiro tab) {
    final tabuleiro = tab;
    final frontPosition = isWhite ? (x, y + 1) : (x, y - 1);
    final upperLeftPosition = isWhite ? (x - 1, y + 1) : (x - 1, y - 1);
    final upperRightPosition = isWhite ? (x + 1, y + 1) : (x + 1, y - 1);

    final frontPiece = tabuleiro[frontPosition];
    final upperLeftPiece = tabuleiro[upperLeftPosition];
    final upperRightPiece = tabuleiro[upperRightPosition];

    final canMoveToFront = frontPiece == null;
    final canMoveUpperLeft =
        (upperLeftPiece != null) && (upperLeftPiece.isWhite != isWhite);
    final canMoveUpperRight =
        (upperRightPiece != null) && (upperRightPiece.isWhite != isWhite);

    return [
      if (canMoveToFront) frontPosition,
      if (canMoveUpperRight) upperRightPosition,
      if (canMoveUpperLeft) upperLeftPosition
    ];
  }

  Peao(
    int x,
    int y,
    bool isWhite,
  ) : super(
          x: x,
          y: y,
          assetPath:
              isWhite ? 'assets/white_pawn.png' : 'assets/black_pawn.png',
          isWhite: isWhite,
        );
}
