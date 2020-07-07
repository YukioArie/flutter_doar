import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RewardPage extends StatefulWidget {
  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recompensas"),
        backgroundColor: Color(0xFFcf2d13),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("empresas").getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Text("Empresas",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Text(
                          " Doar",
                          style: TextStyle(
                              fontFamily: "BDP Birgula",
                              fontSize: 30,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      children: snapshot.data.documents.map((doc) {
                        return Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                height: 100.0,
                                child: Image.network(
                                  doc.data["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      doc.data["title"],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      doc.data["telefone"],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      doc.data["adress"],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Text(
                                      "${doc.data["bairro"]}, ${doc.data["number"]}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        launch(
                                            "https://www.google.com/maps/search/?api=1&query=${doc.data["lat"]},"
                                            "${doc.data["long"]}");
                                      },
                                      padding: EdgeInsets.all(10),
                                      textColor: Color(0xFFcf2d13),
                                      child: Text("Ver no mapa")),
                                  FlatButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                  title: Container(
                                                height: 150,
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Text(" Beneficios",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Spacer(),
                                                        Text(
                                                          " Doar",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "BDP Birgula",
                                                              fontSize: 30,
                                                              color: Colors
                                                                  .black45,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(doc.data["title"],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(doc.data["beneficio"],
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black45,
                                                        )),
                                                  ],
                                                ),
                                              ));
                                            });
                                      },
                                      padding: EdgeInsets.all(10),
                                      textColor: Color(0xFFcf2d13),
                                      child: Text("Ver Beneficio")),
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
