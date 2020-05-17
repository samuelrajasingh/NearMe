import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'model.dart' as hotspots;


class Maper extends StatefulWidget {
  @override
  _MaperState createState() => _MaperState();
}

class _MaperState extends State<Maper> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final postion = await hotspots.getCities();
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
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: const LatLng(28.6448, 77.216721),
            zoom: 5,
          ),

          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
