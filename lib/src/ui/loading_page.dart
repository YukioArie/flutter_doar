import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: FlareActor("assets/LogoLoading.flr", animation: "animate",),
        ),
      ),
      
    );
  }
}
//#fb5a6b
//#fb838f