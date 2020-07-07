import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doar/src/ui/historic_donations_page.dart';
import 'package:flutter_doar/src/ui/login_page.dart';
import 'package:flutter_doar/src/ui/rank_body_page.dart';
import 'package:flutter_doar/src/ui/register_donation_page.dart';
import 'package:flutter_doar/src/ui/reward_page.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _sair() async {
    await _auth.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  final _auth = FirebaseAuth.instance;
  Widget _optionsBtn(
      BuildContext context, String title, Icon iconData, Widget goToPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => goToPage));
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            iconData,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 7,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 48, 10, 15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Bem Vindo, Maria",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Pontos: 5000",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  _optionsBtn(context, "Histórico de doação",
                      Icon(FontAwesome.history), HistoricDonationsPage()),
                  _optionsBtn(context, "Ranking doador",
                      Icon(FontAwesome.trophy), RankBodyPage()),
                  _optionsBtn(context, "Registrar doação",
                      Icon(FontAwesome.qrcode), RegisterDonationPage()),
                  _optionsBtn(context, "Recompensas", Icon(FontAwesome.gift),
                      RewardPage()),
                  Divider(
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      _sair();
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Sair",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Icon(FontAwesome.sign_out),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
