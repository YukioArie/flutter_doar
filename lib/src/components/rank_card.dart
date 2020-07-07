import 'package:flutter/material.dart';

class RankCard extends StatelessWidget {
  final String userName;
  final int pointsRank;
  final int positionRank;
  final String profilePicture;

  RankCard({
    @required this.profilePicture,
    @required this.userName,
    @required this.pointsRank,
    @required this.positionRank,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(positionRank.toString(),
              style: TextStyle(
                fontSize: 25,
              )),
        ),
        Container(
          padding: EdgeInsets.only(),
          width: MediaQuery.of(context).size.width / 1.17,
          height: MediaQuery.of(context).size.height / 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(profilePicture),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(userName,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
              Text(pointsRank.toString(),
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}

/*Card(
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
    );*/
