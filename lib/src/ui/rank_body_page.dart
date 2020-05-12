import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/home_page.dart';
import 'package:flutter_doar/src/ui/login_page.dart';
import 'package:flutter_doar/src/ui/rank_companies_page.dart';
import 'package:flutter_doar/src/ui/rank_users_page.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'card_profile.dart';
import 'hospital_location_page.dart';

class RankBodyPage extends StatefulWidget {
  @override
  _RankBodyPageState createState() => _RankBodyPageState();
}

class _RankBodyPageState extends State<RankBodyPage> {
  var _current = 2;
  var _currentPages = 1;

  final List<Widget> pages = [
      RankUsersPage(),
      RankCompaniesPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length, 
      child: Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rank Doadores"),
        backgroundColor: Color(0xFFcf2d13),
        bottom: TabBar(tabs: [
          Tab(text: "Doadores"),
          Tab(text: "Empresas")
        ]),
      ),
    
      body:TabBarView(
          children: pages,
            
          ),
    ),);
  }
}
