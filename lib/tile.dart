import 'package:chess2/pecas/peca.dart';
import 'package:flutter/material.dart';

Widget tile({
  required bool isWhite,
  bool possibleMove = false,
  Peca? p,
  Peca? selectedPeca,
  required Function() onSelectedPeca,
  required Function() moveToTile,
  required Function() clearSelection,
}) {
  Widget drawPossiblePosition() {
    return const DecoratedBox(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
      child: SizedBox(
        width: 10,
        height: 10,
      ),
    );
  }

  Widget drawPeca(Peca p) {
    return InkWell(
      onTap: () {
        if (selectedPeca != null && possibleMove) {
          moveToTile();
          return;
        }
        //if (selectedPeca == p){
        //  clearSelection();
        //  return;
        //}
        onSelectedPeca();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(p.assetPath),
          ),
        ),
        child: possibleMove
            ? Center(child: drawPossiblePosition())
            : const Center(),
      ),
    );
  }

  return InkWell(
    onTap: () {
      if (selectedPeca != null && possibleMove) {
        moveToTile();
      }
    },
    child: DecoratedBox(
      decoration: BoxDecoration(color: isWhite ? Colors.white : Colors.black),
      child: SizedBox(
        width: 30,
        height: 30,
        child: p != null
            ? drawPeca(p)
            : possibleMove
                ? Center(child: drawPossiblePosition())
                : const Center(),
      ),
    ),
  );
}
