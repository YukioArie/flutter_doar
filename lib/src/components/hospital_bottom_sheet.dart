import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/models/banco_de_sangue_model.dart';
import 'package:flare_flutter/flare_actor.dart';

class HospitalBottomSheet extends StatelessWidget {
  final DocumentSnapshot snapshot;
  HospitalBottomSheet(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text("Banco de sangue",
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
        Padding(
          padding: EdgeInsets.only(
            left: 15,
          ),
          child: Row(
            children: <Widget>[
              Text(snapshot.data["title"],
                  style: TextStyle(
                    color: Colors.black54,
                  ))
            ],
          ),
        ),
        Expanded(
            child: FutureBuilder<QuerySnapshot>(
                future: Firestore.instance
                    .collection("hemocentros")
                    .document(snapshot.documentID)
                    .collection("bancoDeSangue")
                    .getDocuments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  childAspectRatio: 1.0),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return bolsaDeSangueTile(
                                BancoDeSangueModel.fromDocument(
                                    snapshot.data.documents[index]),
                                context);
                          }),
                    );
                }))
      ],
    );
  }

  Widget bolsaDeSangueTile(BancoDeSangueModel data, BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 100,
                    child: FlareActor(
                      "assets/StatusBolsaDeSangueSemLogo.flr",
                      animation: data.status,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Tipo sanguíneo: ${data.type}"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Quantidade: ${data.quantity.toString()} bolsas"),
                      ],
                    ),
                  )
                ],
              ));
            });
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.5,
              child: FlareActor(
                "assets/StatusBolsaDeSangue.flr",
                animation: data.status,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(4),
              child: Column(
                children: <Widget>[
                  Text(
                    data.type,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFcf2d13),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    data.status,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
