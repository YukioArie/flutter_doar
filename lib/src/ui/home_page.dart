
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/card_profile.dart';
import 'package:flutter_doar/src/ui/drawer_widget.dart';
import 'package:flutter_doar/src/ui/hospital_location_page.dart';
import 'package:flutter_doar/src/ui/rank_body_page.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _currentPages = 1;
  final List<Widget> pages = [
    HospitalLocationPage(),
    CardProfile(),
    RankBodyPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPages],
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(  
      items: [
        BottomNavigationBarItem(
          title: Text("Hemocentros"),
          icon: Icon(FontAwesome.hospital_o),
          ),
                  BottomNavigationBarItem(
          title: Text("Carteirinha"),
          icon: Icon(FontAwesome.address_card),
          ),
                  BottomNavigationBarItem(
          title: Text("Rank"),
          icon: Icon(FontAwesome.trophy),
          ),
      
      ],
      currentIndex: _currentPages,
      onTap: (int index) => setState(() => _currentPages = index),
    ),
    
    );
  }
}