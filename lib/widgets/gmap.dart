import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatelessWidget {
  final double lat;
  final double lng;

  const GMap({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(lat, lng),
        zoom: 14,
      ),
      markers: {
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(lat, lng),
        ),
      },
    );
  }
}
