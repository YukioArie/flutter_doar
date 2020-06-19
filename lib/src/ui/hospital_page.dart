import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalPage extends StatefulWidget {
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  List<Widget> _pages = [HospitalListPage(), HospitalLocationPage()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _pages.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              " Doar",
              style: TextStyle(
                fontFamily: "BDP Birgula",
                fontSize: 40,
              ),
            ),
            backgroundColor: Color(0xFFcf2d13),
            bottom: TabBar(tabs: [Tab(text: "Hemocentros"), Tab(text: "Localizar Hemocentros")]),
          ),
          body: TabBarView(children: _pages),
        ),
    );
  }
}

class HospitalListPage extends StatefulWidget {
  @override
  _HospitalListPageState createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }
}

class HospitalLocationPage extends StatefulWidget {
  @override
  _HospitalLocationPageState createState() => _HospitalLocationPageState();
}

class _HospitalLocationPageState extends State<HospitalLocationPage> {
  Set<Marker> markers = new Set<Marker>();
  double lat = -21.754364;
  double lng = -41.3322832;
  GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final Marker marker = Marker(
      markerId: MarkerId("123456"),
      position: LatLng(-21.7438157, -41.3336036),
      infoWindow: InfoWindow(title: "Hemocentro"),
    );
    setState(() {
      markers.add(marker);
    });

    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 14.0,
        ),
        markers: markers,
      ),
    );
  }
}
