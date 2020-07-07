import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/components/hospital_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalCards extends StatelessWidget {
  final DocumentSnapshot snapshot;
  HospitalCards(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: Image.network(
              snapshot.data["image"],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data["title"],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  snapshot.data["adress"],
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  "${snapshot.data["bairro"]}, ${snapshot.data["number"]}",
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
                        "https://www.google.com/maps/search/?api=1&query=${snapshot.data["lat"]},"
                        "${snapshot.data["long"]}");
                  },
                  padding: EdgeInsets.all(10),
                  textColor: Color(0xFFcf2d13),
                  child: Text("Ver no mapa")),
              FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )),
                        context: context,
                        builder: (_) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 1.2,
                            child: HospitalBottomSheet(snapshot),
                          );
                        });
                  },
                  padding: EdgeInsets.all(10),
                  textColor: Color(0xFFcf2d13),
                  child: Text("Visualizar banco de sangue")),
            ],
          )
        ],
      ),
    );
  }
}
