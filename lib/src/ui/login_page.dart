import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/register_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool box = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: MediaQuery.of(context).size.height / 3.0,
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
                      Image.asset("assets/DoarLogo.png",
                          width: 150, height: 150)
                    ]),
              ),
              _TextField(context, "Usuário"),
              _TextField(context, "Senha"),
              Row(children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, left: 25),
                    child: Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.grey,
                        focusColor: Colors.black,
                        value: box,
                        onChanged: (value) {
                          setState(() {
                            box = value;
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 13,
                  ),
                  child: Text(
                    "Lembrar?",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 13, left: 60),
                  child: GestureDetector(
                    onTap: () {
                      print("aqqqqqqqqq");
                    },
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ]),
              Container(
                padding: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Entre com",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 30, top: 15),
                    child: Container(
                      height: 50,
                      width: 70,
                      child: FlatButton(
                        color: Color(0xFF3a559a),
                        onPressed: () {},
                        child: Text(
                          "f",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30, top: 15),
                    child: Container(
                      height: 50,
                      width: 70,
                      child: FlatButton(
                        color: Color(0xFFd94738),
                        onPressed: () {},
                        child: Text(
                          "G",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5, top: 15),
                    child: Container(
                      height: 50,
                      width: 70,
                      child: FlatButton(
                        color: Color(0xFF4ea6ea),
                        onPressed: () {},
                        child: Text(
                          "t",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 65),
                    child: Text(
                      "Não tem conta?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));

                        print("aqaaa");
                      },
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 50),
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
