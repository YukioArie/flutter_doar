import 'package:flutter/material.dart';

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
                    Image.asset("assets/DoarLogo.png", width: 150, height: 150)
                  ]),
            ),
            _TextField(context, "Usuário"),
            _TextField(context, "Senha"),
            Row(
              children: <Widget>[
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
                padding: EdgeInsets.only(top: 13,),
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
                  onTap: (){print("aqqqqqqqqq");},
                  child:Text(
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
                 onPressed: (){},
                 child: Text("Login", style: TextStyle( fontSize: 20),),
                 ),
             ),
             Padding(
                padding: EdgeInsets.only(top:15),
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
                      onPressed: (){}, 
                      child: Text("f", style: TextStyle(fontSize: 40, color: Colors.white),), ),
                  ),
                    ),
                  Padding(                   
                    padding: EdgeInsets.only(right: 30, top: 15),
                    child: Container(
                    height: 50,
                    width: 70,
                    child: FlatButton(color: Color(0xFFd94738),
                    onPressed: (){}, 
                    child: Text("G", style: TextStyle(fontSize: 40, color: Colors.white),), ),
                  ),
                    ),
                  Padding(                    
                    padding: EdgeInsets.only(right: 5, top: 15),
                    child: Container(
                    height: 50,
                    width: 70,
                    child: FlatButton(color: Color(0xFF4ea6ea), 
                    onPressed: (){}, 
                    child: Text("t", style: TextStyle(fontSize: 40, color: Colors.white),), ),
                  ),
                    ),
                ],
              ),
              Row(
           
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 65),
                    child: Text("Não tem conta?", 
                      style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:15, left:8),
                    child: GestureDetector(
                      onTap: (){print("aqaaa");},
                      child: Text("Cadastre-se",
                      style: TextStyle(
                        fontSize: 20
                      ),
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

//#b71c1c
//#dd6567

/*import 'package:flutter/material.dart';
import 'package:revisao/animation.dart';
import 'package:revisao/sliver.dart';

class TelaDeVerificacao extends StatefulWidget {



  @override
  _TelaDeVerificacaoState createState() => _TelaDeVerificacaoState();
}

class _TelaDeVerificacaoState extends State<TelaDeVerificacao> {

  @override
  void initState() {
    super.initState();
    verificar();
  }

  verificar() async {
    var authenticated = await isAuthenticate();

    if (authenticated) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return HomeSliver();
      }));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Animacao();
      }));
    }
  }


  Future<bool> isAuthenticate() async {
    await Future.delayed(Duration(seconds: 3));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

20:20
import 'package:flutter/material.dart';

class Animacao extends StatefulWidget {
  @override
  _AnimacaoState createState() => _AnimacaoState();
}

class _AnimacaoState extends State<Animacao> {
  var size = 300.0;
  var border = 20.0;
  var color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animação')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(border),
              color: color,
            ),
          ),
          RaisedButton(onPressed: () {
            setState(() {
              size = size == 300 ? 100 : 300;
              border = border == 20 ? 150 : 20;
              color = color == Colors.red ? Colors.blue : Colors.red;
            });
          })
        ]),
      ),
    );
  }
}

20:21
import 'package:flutter/material.dart';

class HomeSliver extends StatelessWidget {

  Future<List<Widget>> getItems() async {
    await Future.delayed(Duration(seconds: 3));
    return List<Widget>.generate(15, (i) {
      return Card(child: ListTile(title: Text('item')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Widget>>(
        future: getItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 180,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.all(0),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 10, 7),
                        child: Icon(Icons.image, size: 40),
                      ),
                      Text(
                        'Lista',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(delegate:  SliverChildListDelegate(
                snapshot.data
              ))
            ],
          );
        }
      ),
    );
  }
}

20:31
import 'package:flutter/material.dart';

class HomeSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 180,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: EdgeInsets.all(0),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 7),
                  child: Icon(Icons.image, size: 40),
                ),
                Text('Lista', style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(List<Widget>.generate(15, (i) {
          return Card(
              child: ListTile(
            title: Text('item'),
          ));
        })))
      ],
    ));
  }
}*/
