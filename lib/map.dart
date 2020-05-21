import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'model.dart' as hotspots;

class Maper extends StatefulWidget {
  @override
  _MaperState createState() => _MaperState();
}

class _MaperState extends State<Maper> {
  final Map<String, Marker> _markers = {};
  Location location;
  static const LatLng SOURCE_LOCATION = LatLng(28.644800, 77.216721);
  GoogleMapController controller;
  LocationData currentLocation;

  @override
  void initState() {
    super.initState();
    location = new Location();
    location.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
    });
  }

  Future<void> _onMapCreated(controller) async {
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
    CameraPosition initialCameraPosition =
        CameraPosition(zoom: 5, tilt: 0, bearing: 0, target: SOURCE_LOCATION);
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 17,
          tilt: 0,
          bearing: 0);
    }

     return   Scaffold(
        appBar: AppBar(
            title: const Text('Covid 19 Hotspots'),
            backgroundColor: Color(0xFF3383CD),
              
          
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
            )),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: initialCameraPosition,
              markers: _markers.values.toSet(),
            ),
          ],
        ),
 
    );
  }
}
