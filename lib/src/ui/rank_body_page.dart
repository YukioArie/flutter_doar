import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/components/rank_card.dart';

class RankBodyPage extends StatefulWidget {
  @override
  _RankBodyPageState createState() => _RankBodyPageState();
}

class _RankBodyPageState extends State<RankBodyPage> {
  var users = [];
  @override
  void initState() {
    super.initState();
    Dio()
        .get('http://www.mocky.io/v2/5eb51d5e0e0000330b081f94')
        .then((resposta) {
      setState(() {
        users = resposta.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Rank"),
          backgroundColor: Color(0xFFcf2d13),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.0,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 60,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "2 Lugar",
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset("assets/DoarLogo.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "1 Lugar",
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset("assets/DoarLogo.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 60,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "2 Lugar",
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset("assets/DoarLogo.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              padding: EdgeInsets.only(bottom: 2),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: ListView(
                children: users.map((ranking) {
                  return Padding(
                      padding: EdgeInsets.all(3),
                      child: RankCard(
                          profilePicture: ranking['profilePicture'],
                          userName: ranking['userName'],
                          pointsRank: ranking['pointsRank'],
                          positionRank: ranking['positionRank']));
                }).toList(),
              ),
            ))
          ],
        ));
  }
}
