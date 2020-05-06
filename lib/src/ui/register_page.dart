import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool box = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
        backgroundColor: Color(0xFFcf2d13),
      ),
      body: SingleChildScrollView(
        child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFcf2d13), Color(0xFFdd6464)])),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/DoarLogo.png", width: 150, height: 150)
                  ]),
            ),
            _TextField(context, "Usuário"),
            _TextField(context, "Email"),
            _TextField(context, "Senha"),
            _TextField(context, "Senha Novamente"),
            Padding(padding: EdgeInsets.only(top:30),
            child: Container(               
               width: MediaQuery.of(context).size.width / 1.2,
               height: 45,
               child: RaisedButton(
                 color: Colors.white,
                 onPressed: (){},
                 child: Text("Cadastrar", style: TextStyle( fontSize: 20),),
                 ),
             ),),           
              Container(height: 45),
          ],
        ),
      ),
      ),
    );
  }
}

Widget _TextField(BuildContext context, String texto) {
  return Container(
    padding: EdgeInsets.only(top: 32),
    child: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 50,
          padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                )
              ]),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.verified_user,
                color: Colors.grey,
              ),
              hintText: texto,
            ),
          ),
        ),
      ],
    ),
  );
}
