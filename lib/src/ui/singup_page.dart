import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/main_page.dart';

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
  var _email = '';
  var _senha = '';
  final _auth = FirebaseAuth.instance;
  Widget _lblUsername() {
    return Theme(
      data: ThemeData(primaryColor: Colors.black45),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "Insere nome de usuário!";
          }
          return null;
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

  Widget _lblPassword() {
    return Theme(
      data: ThemeData(primaryColor: Colors.black45),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "Insere senha!";
          }
          return null;
        },
        onSaved: (value) => _senha = value,
        controller: senhaController,
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
          labelText: "Senha",
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
          return null;
        },
        onSaved: (value) => _email = value,
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
            return _entrar();
          }
          return null;
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
                  _lblPassword(),
                  SizedBox(height: 10.0),
                  _lblLogin(),
                ],
              ),
            ),
          ),
        ));
  }

  _entrar() async {
    _formKey.currentState.save();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _email, password: _senha);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainPage(),
      ));
    } catch (e) {
      print(e);
    }

    print(_email);
    print(_senha);
  }
}

final kHintTextStyle = TextStyle(
  color: Colors.black45,
  fontFamily: 'OpenSans',
);
