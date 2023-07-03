import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: const GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: LatLng(10, 10), zoom: 5),
            ),
          ),
          const Positioned(
              top: 50, left: 20, right: 20, child: LocationSearchBox()),
        ],
      ),
    );
  }
}

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter Your Location',
          suffixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5, right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}


// class LocationScreen extends StatefulWidget {
//   const LocationScreen({super.key});

//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   final Completer<GoogleMapController> controller = Completer();

//   static LatLng sourceLocation = const LatLng(37.3352, -122);
//   static LatLng destinationLocation = const LatLng(37.3342, -122.0660);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Location',
//         ),
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios),
//             onPressed: () => Navigator.of(context, rootNavigator: true).pop()),
//         automaticallyImplyLeading: true,
//       ),
//       body: GoogleMap(
//           initialCameraPosition:
//               CameraPosition(target: sourceLocation, zoom: 12),
//           markers: {
//             Marker(
//               markerId: const MarkerId("source"),
//               position: sourceLocation,
//             ),
//             Marker(
//               markerId: const MarkerId("destination"),
//               position: destinationLocation,
//             ),
//           }),
//     );
//   }
// }
