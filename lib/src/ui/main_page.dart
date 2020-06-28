import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/card_profile_page.dart';
import 'package:flutter_doar/src/ui/historic_donations_page.dart';
import 'package:flutter_doar/src/ui/hospital_page.dart';
import 'package:flutter_doar/src/ui/profile_page.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _goToCardProfilePage = true;
  int _currentPages = 1;
  final List<Widget> _pages = [
    HospitalPage(),
   HistoricDonationsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _goToCardProfilePage = true;
            });
          },
          child: Icon(FontAwesome.address_card),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: _goToCardProfilePage == false ? Colors.red : Colors.grey,
          currentIndex: _currentPages,
          onTap: (index) {
            setState(() {
              _currentPages = index;
              _goToCardProfilePage = false;
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
      body: _goToCardProfilePage == true ? CardProfilePage() :  _pages[_currentPages],
    );
  }
}
