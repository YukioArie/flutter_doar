import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/card_profile.dart';
import 'package:flutter_doar/src/ui/historic_donations_page.dart';
import 'package:flutter_doar/src/ui/hospital_page.dart';
import 'package:flutter_doar/src/ui/profile_page.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPages = 1;
  final List<Widget> _pages = [
    HospitalPage(),
    CardProfile(),
   HistoricDonationsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentPages = 1;
            });
          },
          child: Icon(FontAwesome.address_card),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: BottomNavigationBar(
          currentIndex: _currentPages,
          onTap: (index) {
            setState(() {
              _currentPages = index;
            });
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.hospital_o),
              title: Text("Hemocentros"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.user_circle),
              title: Text("Minha conta"),
            ),
          ],
        ),
      ),
      body: _pages[_currentPages],
    );
  }
}
