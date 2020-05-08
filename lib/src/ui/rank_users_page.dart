import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/rank_card.dart';

class RankUsersPage extends StatefulWidget {
  @override
  _RankUsersPageState createState() => _RankUsersPageState();
}

class _RankUsersPageState extends State<RankUsersPage> {
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

  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

