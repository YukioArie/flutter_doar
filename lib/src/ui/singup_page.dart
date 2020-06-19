import 'package:flutter/material.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaNovamenteController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _lblUsername() {
    return Theme(
      data: ThemeData(primaryColor: Colors.black45),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "Insere nome de usuário!";
          }
        },
        controller: usernameController,
        keyboardType: TextInputType.emailAddress,
        style: kHintTextStyle,
        decoration: InputDecoration(
          errorStyle: kHintTextStyle,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.black45,
            size: 22.0,
          ),
          labelText: "Nome Completo",
          labelStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _lblPassword(String lblText, TextEditingController textoController) {
    return Theme(
      data: ThemeData(primaryColor: Colors.black45),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "Insere senha!";
          }
        },
        controller: textoController,
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        style: kHintTextStyle,
        decoration: InputDecoration(
          errorStyle: kHintTextStyle,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black45,
            size: 22.0,
          ),
          labelText: lblText,
          labelStyle: TextStyle(color: Colors.black45, fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget _lblEmail() {
    return Theme(
      data: ThemeData(primaryColor: Colors.black45),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "Insere email!";
          }
        },
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: kHintTextStyle,
        decoration: InputDecoration(
          errorStyle: kHintTextStyle,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.black45,
            size: 22.0,
          ),
          labelText: "Email",
          labelStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _lblLogin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            return Navigator.pop(context);
          }
        },
        color: Colors.white,
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          "Cadastrar",
          style: TextStyle(
            color: Colors.black45,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Cadastro"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Container(
                height: 130,
                width: 130,
                child: Image.asset("assets/DoarLogo.png"),
              ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _lblUsername(),
                  SizedBox(height: 20.0),
                  _lblEmail(),
                  SizedBox(height: 20.0),
                  _lblPassword("Senha", senhaController),
                  SizedBox(height: 20.0),
                  _lblPassword("Senha novamente", senhaNovamenteController),
                  SizedBox(height: 10.0),
                  _lblLogin(),
                ],
              ),
            ),
          ),
        ));
  }
}

final kHintTextStyle = TextStyle(
  color: Colors.black45,
  fontFamily: 'OpenSans',
);
