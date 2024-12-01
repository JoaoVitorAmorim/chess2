import 'package:chess2/position.dart';
import 'package:chess2/tabuleiro.dart';

List<Position> getHorizontalMoves(Tabuleiro tab, bool isWhite, int x, int y) {
  return getLeftHorizontalMoves(tab, isWhite, x, y) +
      getRightHorizontalMoves(tab, isWhite, x, y);
}

List<Position> getLeftHorizontalMoves(
    Tabuleiro tab, bool isWhite, int x, int y) {
  final possibleMoves = <Position>[];
  var xPos = x;
  var yPos = y;
  while (xPos >= 1) {
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
  }
  return possibleMoves;
}

List<Position> getRightHorizontalMoves(
    Tabuleiro tab, bool isWhite, int x, int y) {
  final possibleMoves = <Position>[];
  var xPos = x;
  var yPos = y;
  while (xPos <= 8) {
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
  }
  return possibleMoves;
}

List<Position> getVerticalMoves(Tabuleiro tab, bool isWhite, int x, int y) {
  return getTopVerticalMoves(tab, isWhite, x, y) +
      getBottomVerticalMoves(tab, isWhite, x, y);
}

List<Position> getTopVerticalMoves(Tabuleiro tab, bool isWhite, int x, int y) {
  final possibleMoves = <Position>[];
  var xPos = x;
  var yPos = y;
  while (yPos >= 1) {
    if (tab[(xPos, yPos)] == null) {
      possibleMoves.add((xPos, yPos));
    }
    if (tab[(xPos, yPos)] != null && tab[(xPos, yPos)]!.isWhite != isWhite) {
      possibleMoves.add((xPos, yPos));
      break;
    }

    if (yPos != y &&
        tab[(xPos, yPos)] != null &&
        tab[(xPos, yPos)]!.isWhite == isWhite) {
      break;
    }

    yPos--;
  }
  return possibleMoves;
}

List<Position> getBottomVerticalMoves(
    Tabuleiro tab, bool isWhite, int x, int y) {
  final possibleMoves = <Position>[];
  var xPos = x;
  var yPos = y;
  while (yPos <= 8) {
    if (tab[(xPos, yPos)] == null) {
      possibleMoves.add((xPos, yPos));
    }
    if (tab[(xPos, yPos)] != null && tab[(xPos, yPos)]!.isWhite != isWhite) {
      possibleMoves.add((xPos, yPos));
      break;
    }

    if (yPos != y &&
        tab[(xPos, yPos)] != null &&
        tab[(xPos, yPos)]!.isWhite == isWhite) {
      break;
    }

    yPos++;
  }
  return possibleMoves;
}
