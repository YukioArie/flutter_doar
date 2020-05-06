import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/home_page.dart';
import 'package:flutter_doar/src/ui/loading_page.dart';
import 'package:flutter_doar/src/ui/login_page.dart';
import 'package:flutter_doar/src/ui/register_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}