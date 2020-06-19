import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  Widget _lblEmail() {
    return Theme(
      data: ThemeData(primaryColor: Colors.black45),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "Insira email!";
          }
        },
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black45, fontFamily: 'OpenSans'),
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.black45, fontFamily: 'OpenSans'),
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
          "Enviar",
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
          title: Text("Senha"),
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
                vertical: 80.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Esqueceu a senha?",
                        style: TextStyle(
                            color: Colors.black45,
                            fontFamily: "OpenSans",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "____________________________________________________",
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Informe seu email e enviaremos instruções para você criar sua senha.",
                    style: TextStyle(
                      color: Colors.black45,
                      fontFamily: "OpenSans",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(height: 20.0),
                  _lblEmail(),
                  SizedBox(height: 20.0),
                  _lblLogin(),
                ],
              ),
            ),
          ),
        ));
  }
}
