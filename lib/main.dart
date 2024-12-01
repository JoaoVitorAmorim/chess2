import 'package:chess2/pecas/bispo.dart';
import 'package:chess2/pecas/cavalo.dart';
import 'package:chess2/pecas/dama.dart';
import 'package:chess2/pecas/peao.dart';
import 'package:chess2/pecas/peca.dart';
import 'package:chess2/pecas/rei.dart';
import 'package:chess2/pecas/torre.dart';
import 'package:chess2/position.dart';
import 'package:chess2/tabuleiro.dart';
import 'package:chess2/tile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tabuleiro = Tabuleiro();
  final List<Position> possibleMoves = [];
  Peca? selectedPeca;

  @override
  void initState() {
    initTabuleiro();
    super.initState();
  }

  void initTabuleiro() {
    tabuleiro.clear();
    possibleMoves.clear();

    //white peao
    tabuleiro.addAll({(1, 2): Peao(1, 2, true)});
    tabuleiro.addAll({(2, 2): Peao(2, 2, true)});
    tabuleiro.addAll({(3, 2): Peao(3, 2, true)});
    tabuleiro.addAll({(4, 2): Peao(4, 2, true)});
    tabuleiro.addAll({(5, 2): Peao(5, 2, true)});
    tabuleiro.addAll({(6, 2): Peao(6, 2, true)});
    tabuleiro.addAll({(7, 2): Peao(7, 2, true)});
    tabuleiro.addAll({(8, 2): Peao(8, 2, true)});

    //white pecas
    tabuleiro.addAll({(1, 1): Torre(1, 1, true)});
    tabuleiro.addAll({(2, 1): Cavalo(2, 1, true)});
    tabuleiro.addAll({(3, 1): Bispo(3, 1, true)});
    tabuleiro.addAll({(4, 1): Rei(4, 1, true)});
    tabuleiro.addAll({(5, 1): Dama(5, 1, true)});
    tabuleiro.addAll({(6, 1): Bispo(6, 1, true)});
    tabuleiro.addAll({(7, 1): Cavalo(7, 1, true)});
    tabuleiro.addAll({(8, 1): Torre(8, 1, true)});

    //black peao
    tabuleiro.addAll({(1, 7): Peao(1, 7, false)});
    tabuleiro.addAll({(2, 7): Peao(2, 7, false)});
    tabuleiro.addAll({(3, 7): Peao(3, 7, false)});
    tabuleiro.addAll({(4, 7): Peao(4, 7, false)});
    tabuleiro.addAll({(5, 7): Peao(5, 7, false)});
    tabuleiro.addAll({(6, 7): Peao(6, 7, false)});
    tabuleiro.addAll({(7, 7): Peao(7, 7, false)});
    tabuleiro.addAll({(8, 7): Peao(8, 7, false)});

    //black pecas
    tabuleiro.addAll({(1, 8): Torre(1, 8, false)});
    tabuleiro.addAll({(2, 8): Cavalo(2, 8, false)});
    tabuleiro.addAll({(3, 8): Bispo(3, 8, false)});
    tabuleiro.addAll({(4, 8): Rei(4, 8, false)});
    tabuleiro.addAll({(5, 8): Dama(5, 8, false)});
    tabuleiro.addAll({(6, 8): Bispo(6, 8, false)});
    tabuleiro.addAll({(7, 8): Cavalo(7, 8, false)});
    tabuleiro.addAll({(8, 8): Torre(8, 8, false)});




    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => initTabuleiro(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: GridView.builder(
          itemCount: 64,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8),
          itemBuilder: (context, count) {
            final x = (count % 8) + 1;
            final y = ((count ~/ 8)) + 1;
            final peca = tabuleiro[(x, y)];

            final isWhite =
                y.isOdd ? (x.isEven ? false : true) : (x.isEven ? true : false);

            return tile(
              isWhite: isWhite,
              p: peca,
              possibleMove: possibleMoves.contains((x, y)),
              selectedPeca: selectedPeca,
              onSelectedPeca: () {
                if (peca != null) {
                  possibleMoves.clear();
                  possibleMoves.addAll(peca.allowedPositions(tabuleiro));
                  selectedPeca = peca;
                  setState(() {});
                }
              },
              moveToTile: () {
                if (selectedPeca != null) {
                  tabuleiro.removeWhere(
                    (key, value) => key == (selectedPeca!.x, selectedPeca!.y),
                  );
                  tabuleiro.removeWhere(
                    (key, value) => key == (x, y),
                  );
                  selectedPeca!.updatePosition(x, y);
                  tabuleiro.addAll({(x, y): selectedPeca});
                  possibleMoves.clear();
                  checkPeaoPromotion((x, y), selectedPeca!, context, tabuleiro);
                  setState(() {});
                }
              },
              clearSelection: () {
                selectedPeca = null;
                possibleMoves.clear();
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }

  void checkPeaoPromotion(
      Position position, Peca peca, BuildContext context, Tabuleiro tab) {
    if (peca.runtimeType == Peao) {
      if (position.$2 == 8 || position.$2 == 1) {
        promotePawn(context, peca as Peao, tab);
      }
    }
  }

  Future<void> promotePawn(
    context,
    Peao p,
    Tabuleiro tab,
  ) async {
    Widget drawPeca(String path) {
      return InkWell(
        onTap: () {
          tab.removeWhere(
            (key, value) => key == (p.x, p.y),
          );
          tab.addAll({(p.x, p.y): Dama(p.x, p.y, p.isWhite)});
          Navigator.of(context).pop();
          setState(() {});
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(path),
            ),
          ),
          child: const SizedBox(
            width: 60,
            height: 60,
          ),
        ),
      );
    }

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        final color = p.isWhite ? 'white' : 'black';

        final pecasPaths = [
          'knight.png',
          'bishop.png',
          'rook.png',
          'queen.png'
        ];

        String pecaPath(String path) => 'assets/${color}_$path';
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (String path in pecasPaths) drawPeca(pecaPath(path))
            ],
          ),
        );
      },
    );
  }
}
