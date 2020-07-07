import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/login_page.dart';
import 'package:flutter_doar/src/ui/main_page.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    final user = await _auth.currentUser();
    if (user != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: FlareActor(
            "assets/LogoLoading.flr",
            animation: "animate",
          ),
        ),
      ),
    );
  }
}
//#fb5a6b
//#fb838f
