import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/home_page.dart';
import 'package:flutter_doar/src/ui/login_page.dart';
import 'package:flutter_doar/src/ui/rank_companies_page.dart';
import 'package:flutter_doar/src/ui/rank_users_page.dart';

class RankBodyPage extends StatefulWidget {
  @override
  _RankBodyPageState createState() => _RankBodyPageState();
}

class _RankBodyPageState extends State<RankBodyPage> {
  var _current = 2;
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
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFFcf2d13),
        backgroundColor: Colors.white,
        buttonBackgroundColor:Color(0xFFcf2d13),
        height: 50,
        items: <Widget>[
          Icon(Icons.verified_user, size: 20, color: Colors.grey[200]),
          Icon(Icons.calendar_today, size: 20, color: Colors.grey[200]),
          Icon(Icons.power_input, size: 20, color: Colors.grey[200]),
          Icon(Icons.local_shipping, size: 20, color: Colors.grey[200]),
          Icon(Icons.lock, size: 20, color: Colors.grey[200]),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceIn,
        onTap: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      
      body:TabBarView(
          children: pages,
            
          ),
    ),);
  }
}
