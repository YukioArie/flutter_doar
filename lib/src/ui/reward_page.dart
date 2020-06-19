import 'package:flutter/material.dart';


class RewardPage extends StatefulWidget {
  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Benefícios"),
        backgroundColor: Color(0xFFcf2d13),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                "Parceiros",
                style: TextStyle(fontSize: 50, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: Row(
             
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Empresas(),
                Empresas(),
                
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}

Widget Empresas() {
  return Container(
    width: 150,
    height: 148,
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 5,
      )
    ]),
    padding: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          child: Image.asset("assets/DoarLogo.png"),
        ),
        Center(
            child: Container(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "Empresa",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        )),
      ],
    ),
  );
}
