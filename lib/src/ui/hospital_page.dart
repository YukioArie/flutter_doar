import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/components/hospital_cards.dart';

class HospitalPage extends StatefulWidget {
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text(" Doar", style: TextStyle(fontFamily: "BDP Birgula", fontSize: 40,),),
        backgroundColor: Color(0xFFcf2d13),
      ),
    body: FutureBuilder<QuerySnapshot>(future: Firestore.instance.collection("hemocentros").getDocuments(),
    builder: (context, snapshot){
      if(!snapshot.hasData){
        return Center(
          child: CircularProgressIndicator(),
        );
      }else{
        return ListView(
          children: snapshot.data.documents.map((doc){
            return HospitalCards(doc);
          }
          ).toList(),
        );
      }
    }),
    );
  }
}
