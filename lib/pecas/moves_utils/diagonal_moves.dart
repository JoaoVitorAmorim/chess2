import 'package:chess2/position.dart';
import 'package:chess2/tabuleiro.dart';

List<Position> getDiagonalMoves(Tabuleiro tab, bool isWhite, int x, int y) {
  return getTopLeftDiagonalMoves(tab, isWhite, x, y) +
      getTopRightDiagonalMoves(tab, isWhite, x, y) +
      getBottomLeftDiagonalMoves(tab, isWhite, x, y) +
      getBottomRightDiagonalMoves(tab, isWhite, x, y);
}

List<Position> getTopLeftDiagonalMoves(
    Tabuleiro tab, bool isWhite, int x, int y) {
  final possibleMoves = <Position>[];
  var xPos = x;
  var yPos = y;
  while (xPos <= 8 && yPos <= 8 && xPos > 0 && yPos > 0) {
    if (tab[(xPos, yPos)] == null) {
      possibleMoves.add((xPos, yPos));
    }
    if (tab[(xPos, yPos)] != null && tab[(xPos, yPos)]!.isWhite != isWhite) {
      possibleMoves.add((xPos, yPos));
      break;
    }
    if (xPos != x &&
        tab[(xPos, yPos)] != null &&
        tab[(xPos, yPos)]!.isWhite == isWhite) {
      break;
    }

    xPos--;
    yPos--;
  }
  return possibleMoves;
}

List<Position> getTopRightDiagonalMoves(
    Tabuleiro tab, bool isWhite, int x, int y) {
  final possibleMoves = <Position>[];
  var xPos = x;
  var yPos = y;
  while (xPos <= 8 && yPos <= 8 && xPos > 0 && yPos > 0) {
    if (tab[(xPos, yPos)] == null) {
      possibleMoves.add((xPos, yPos));
    }
    if (tab[(xPos, yPos)] != null && tab[(xPos, yPos)]!.isWhite != isWhite) {
      possibleMoves.add((xPos, yPos));
      break;
    }
    if (xPos != x &&
        tab[(xPos, yPos)] != null &&
        tab[(xPos, yPos)]!.isWhite == isWhite) {
      break;
    }

    xPos++;
    yPos--;
  }
  return possibleMoves;
}

List<Position> getBottomLeftDiagonalMoves(
    Tabuleiro tab, bool isWhite, int x, int y) {
  final possibleMoves = <Position>[];
  var xPos = x;
  var yPos = y;
  while (xPos <= 8 && yPos <= 8 && xPos > 0 && yPos > 0) {
    if (tab[(xPos, yPos)] == null) {
      possibleMoves.add((xPos, yPos));
    }
    if (tab[(xPos, yPos)] != null && tab[(xPos, yPos)]!.isWhite != isWhite) {
      possibleMoves.add((xPos, yPos));
      break;
    }
    if (xPos != x &&
        tab[(xPos, yPos)] != null &&
        tab[(xPos, yPos)]!.isWhite == isWhite) {
      break;
    }

    xPos--;
    yPos++;
  }
  return possibleMoves;
}

List<Position> getBottomRightDiagonalMoves(
    Tabuleiro tab, bool isWhite, int x, int y) {
  final possibleMoves = <Position>[];
  var xPos = x;
  var yPos = y;
  while (xPos <= 8 && yPos <= 8 && xPos > 0 && yPos > 0) {
    if (tab[(xPos, yPos)] == null) {
      possibleMoves.add((xPos, yPos));
    }
    if (tab[(xPos, yPos)] != null && tab[(xPos, yPos)]!.isWhite != isWhite) {
      possibleMoves.add((xPos, yPos));
      break;
    }
    if (xPos != x &&
        tab[(xPos, yPos)] != null &&
        tab[(xPos, yPos)]!.isWhite == isWhite) {
      break;
    }

    xPos++;
    yPos++;
  }
  return possibleMoves;
}
