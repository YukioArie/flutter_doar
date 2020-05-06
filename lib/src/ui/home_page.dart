import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _current = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cartão Doador"),
        backgroundColor: Color(0xFFcf2d13),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Color(0xFFcf2d13),
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: <Widget>[
          Icon(Icons.verified_user, size: 20, color: Colors.black),
          Icon(Icons.calendar_today, size: 20, color: Colors.black),
          Icon(Icons.power_input, size: 20, color: Colors.black),
          Icon(Icons.local_shipping, size: 20, color: Colors.black),
          Icon(Icons.lock, size: 20, color: Colors.black),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceIn,
        onTap: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      body: Container(
          color: Color(0xFFcf2d13),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.width / 0.9,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                ),
              ]),
                child: Stack(
                    children: [
                      Column(
                        children: <Widget>[
                      Container(
                        height: 130,
                        width: 350,
                        color: Color(0xFFcf2d13),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 35, left: 20),
                          child: Center(
                            child: Text(
                              "Doador(a)",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 75),
                      child:Center(child: Text("Maria Eduarda da Silva", style: TextStyle(fontSize: 25, color: Colors.grey,),),)),
                      Padding(padding: EdgeInsets.only(top: 5),
                      child:Center(child: Text("Maria10", style: TextStyle(fontSize: 20, color: Colors.grey),),)),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 15, right: 20),
                          child: Text("Tipo Sanguíneo", style: TextStyle(fontSize: 25, color: Colors.grey),)),
                        Padding(padding: EdgeInsets.only(top: 15),
                        child: Text("O+", style: TextStyle(fontSize: 25, color: Color(0xFFcf2d13)),))
                      ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 80),
                        child: Text("Vencimento", style: TextStyle(fontSize: 25, color: Colors.grey),))

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 8),
                        child: Text("10/12/2020", style: TextStyle(fontSize: 23, color: Colors.grey),))

                        ],
                      )

                      ]
                      ),
                      Align(
                        alignment: Alignment(0, -0.5),
                        child: GestureDetector(
                          child: Container(
                          
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            /*image: DecorationImage(
                              image: AssetImage("assets/DoarLogo.png")) */
                          ),               
                          ),
                        ),
                      )
                    ],
                  )
                
          
            ),
          )),
    );
  }
}
