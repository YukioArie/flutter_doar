import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/RegisterDonationPage.dart';
import 'package:flutter_doar/src/ui/doubts_page.dart';
import 'package:flutter_doar/src/ui/home_page.dart';
import 'package:flutter_doar/src/ui/profile_selos_page.dart';
import 'package:flutter_doar/src/ui/reward_page.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  GlobalKey drawerKey = GlobalKey();
  var currentPage = 0;
  final List<Widget> pages = [
    HomePage(),
    RegisterDonationPage(),
    RewardPage(),
    ProfileSelosPage(),
    DoubtsPage()
  ];
  gotToPage(int index) {
    Navigator.pop(drawerKey.currentContext);
    
    setState(() {
      currentPage = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: drawerKey,
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Image.asset("assets/DoarLogo.png")),
          ListTile(
            title: Text("Tela Inicial"),
            onTap: () {
            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
            },
            selected: currentPage == 0,
          ),
          ListTile(
            title: Text("Registrar Doação"),
            onTap: () {
              gotToPage(1);
            },
            selected: currentPage == 1,
          ),
          ListTile(
            title: Text("Recompensa"),
            onTap: () {
              gotToPage(2);
            },
            selected: currentPage == 2,
          ),
          ListTile(
            title: Text("Selos"),
            onTap: () {
              gotToPage(3);
            },
            selected: currentPage == 3,
          ),
          ListTile(
            title: Text("Dúvidas?"),
            onTap: () {
              gotToPage(4);
            },
            selected: currentPage == 4,
          ),
        ],
      ),
    );
  }
}
