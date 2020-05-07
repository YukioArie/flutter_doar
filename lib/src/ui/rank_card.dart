import 'package:flutter/material.dart';

class RankCard extends StatelessWidget {
  final String nomeUsuario;
  final int pontos;
  final int posicao;
  final String img;

  RankCard({
    @required this.img,
    @required this.nomeUsuario,
    @required this.pontos,
    @required this.posicao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(img),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(nomeUsuario),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(posicao.toString()),
            )
          ],
        ),
      ),
    );
  }
}
