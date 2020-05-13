import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Hemocentros"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, lng),
            zoom: 14.0,         
          ),
        ),
    );
  }
}
