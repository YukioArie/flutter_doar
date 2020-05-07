import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/rank_card.dart';

class RankUsersPage extends StatefulWidget {
  @override
  _RankUsersPageState createState() => _RankUsersPageState();
}

class _RankUsersPageState extends State<RankUsersPage> {
  var rank = [];
  @override
  void initState() {
    super.initState();
    Dio().get('http://www.mocky.io/v2/5eb3cc473200008fb77b8b20').then((resposta) {
      setState(() {
        rank = resposta.data;
      });
    });
  }
  Widget build(BuildContext context) {

    
    return Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.9,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 30,
                              bottom: 10,
                              right: 20,
                            ),
                            child: Text(
                              "2 Lugar",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                
                                image: DecorationImage(image: AssetImage("assets/DoarLogo.png"))
                              ),
                              //child: Image.network("https://https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSx78gdknskgTRgLOPfjJD8FG0B1UdwPwHYEwH5y1PMDEOvrXZ8&usqp=CAU"),
                            ),
                          ),
                          // Padding(padding: EdgeInsets.only(top:5), child: Text("sadassssd", style: TextStyle(fontSize: 15.0),),),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, right: 20),
                            child: Text(
                              "1 Lugar",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                
                                image: DecorationImage(
                              image: AssetImage("assets/DoarLogo.png")) 
                              ),
                            ),
                          ),
                          //Padding(padding: EdgeInsets.only(top:5), child: Text("sadassssd", style: TextStyle(fontSize: 15.0)),),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(top: 30, bottom: 10, right: 20),
                            child: Text(
                              "3 Lugar",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                
                              image: DecorationImage(
                              image: AssetImage("assets/DoarLogo.png")) 
                              ),
                            ),
                          ),
                          //Padding(padding: EdgeInsets.only(top:5), child: Text("Maria Eduarda da silva", style: TextStyle(fontSize: 15.0),),),
                        ],
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
            child: ListView(
              children: rank.map((ranking) {
                return RankCard(img: ranking['img'] ,nomeUsuario: ranking['nomeUsuario'], pontos: ranking['pontos'], posicao: ranking['posicao'],);
              }).toList(),
            ),
              ),
        ],
    );
  }
}