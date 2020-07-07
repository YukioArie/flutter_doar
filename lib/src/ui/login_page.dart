import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/singup_page.dart';

import 'forgot_password_page.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool lembrar = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  var _email = '';
  var _senha = '';

  Widget _lblPassword() {
    return Theme(
      data: ThemeData(primaryColor: Colors.black45),
      child: TextFormField(
        onSaved: (value) => _senha = value,
        validator: (value) {
          if (value.isEmpty) {
            return "Insira senha!";
          }
          return null;
        },
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
          labelStyle: kHintTextStyle,
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
            return "Insira email!";
          }
          return null;
        },
        onSaved: (value) => _email = value,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black45, fontFamily: 'OpenSans'),
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
          labelStyle: TextStyle(color: Colors.black45, fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget _lblForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
        ),
        child: Text(
          "Esqueceu a senha?",
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _rememberMeCheckBox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.black45),
              child: Checkbox(
                value: lembrar,
                onChanged: (value) {
                  setState(() {
                    lembrar = value;
                  });
                },
                checkColor: Colors.white,
                activeColor: Colors.black45,
              )),
          Text(
            "Lembrar?",
            style: kLabelStyle,
          )
        ],
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
          "LOGIN",
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

  Widget _lblSingup() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SingupPage())),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Não tem Conta? ",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
              text: "Cadastre",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 80.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                child: Image.asset("assets/DoarLogo.png"),
              ),
              SizedBox(
                height: 30.0,
              ),
              _lblEmail(),
              SizedBox(height: 30.0),
              _lblPassword(),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              _lblForgotPassword(),
              _lblLogin(),
              _lblSingup(),
            ],
          ),
        ),
      ),
    ));
  }

  _entrar() async {
    _formKey.currentState.save();
    try {
      await _auth.signInWithEmailAndPassword(email: _email, password: _senha);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
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

final kLabelStyle = TextStyle(
  color: Colors.black45,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
