import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'model.dart';

class Maper extends StatefulWidget {
  @override
  _MaperState createState() => _MaperState();
}

class _MaperState extends State<Maper> {
  final Map<String, Marker> _markers = {};
 Hotspots hotspots;
  Future<void> _onMapCreated(GoogleMapController controller) async {
    var postion = await hotspots.getCities();
    setState(() {
      _markers.clear();
      for (final city in postion.cities) {
        final marker = Marker(
          markerId: MarkerId(city.name),
          position: LatLng(city.latitude, city.longitude),
          infoWindow: InfoWindow(
            title: city.name,
          ),
        );
        _markers[city.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Covid 19 Hotspots'),
          backgroundColor: Colors.red,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(28.6448, 77.216721),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}